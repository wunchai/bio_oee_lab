import 'dart:io'; // สำหรับเช็ค Platform
import 'package:flutter/foundation.dart'; // สำหรับ kIsWeb
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/running_job_detail_screen.dart';
// Import สำหรับ QR Code
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';

class RunningJobScreen extends StatefulWidget {
  const RunningJobScreen({super.key});

  @override
  State<RunningJobScreen> createState() => _RunningJobScreenState();
}

class _RunningJobScreenState extends State<RunningJobScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isUploading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------
  // 📸 ส่วนจัดการ QR Code (เหมือนหน้า JobScreen)
  // ---------------------------------------------------------

  void _showScanOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Scan with Camera'),
              onTap: () {
                Navigator.pop(context);
                _scanFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Scan from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _scanFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanFromCamera() async {
    // เปิดหน้า ScannerScreen (นิยามไว้ด้านล่าง)
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      _updateSearch(result);
    }
  }

  Future<void> _scanFromGallery() async {
    // ดักจับ Platform เพื่อป้องกัน Error บน Windows/Web
    if (kIsWeb ||
        (!Platform.isAndroid && !Platform.isIOS && !Platform.isMacOS)) {
      _showError(
        'ฟีเจอร์ "สแกนจากรูปภาพ" รองรับเฉพาะบนมือถือ (Android/iOS) เท่านั้น',
      );
      return;
    }

    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final controller = MobileScannerController();
        try {
          final BarcodeCapture? capture = await controller.analyzeImage(
            image.path,
          );

          if (capture != null && capture.barcodes.isNotEmpty) {
            final String? code = capture.barcodes.first.rawValue;
            if (code != null) {
              _updateSearch(code);
            } else {
              _showError('QR Code not found in image.');
            }
          } else {
            _showError('No QR Code detected.');
          }
        } catch (e) {
          _showError('Error analyzing image: $e');
        } finally {
          controller.dispose();
        }
      }
    } catch (e) {
      _showError('Cannot pick image: $e');
    }
  }

  void _updateSearch(String code) {
    setState(() {
      _searchController.text = code;
      _searchQuery = code;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Found: $code')));
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // ---------------------------------------------------------
  // จบส่วน QR Code
  // ---------------------------------------------------------

  Future<void> _handleManualUpload() async {
    setState(() {
      _isUploading = true;
    });

    try {
      final docRepo = context.read<DocumentRepository>();
      await docRepo.uploadPendingDocuments();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data synced to server successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final documentRepo = context.watch<DocumentRepository>();
    final loginRepo = context.watch<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    if (userId.isEmpty) {
      return const Center(child: Text('Please login first'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Jobs'), // Restore Title
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: _buildSearchBar(),
          ),
        ),
        actions: [
          // 2. ปุ่ม Upload
          IconButton(
            icon: _isUploading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.cloud_upload),
            tooltip: 'Sync Data',
            onPressed: _isUploading ? null : _handleManualUpload,
          ),
        ],
      ),
      body: StreamBuilder<List<DbDocument>>(
        stream: documentRepo.watchActiveDocuments(userId, query: _searchQuery),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!;

          if (docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.assignment_late_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _searchQuery.isEmpty
                        ? 'No running jobs.'
                        : 'No result for "$_searchQuery"',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final doc = docs[index];
              return _buildRunningJobCard(context, doc);
            },
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search Document...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          // ⬇️ เพิ่มปุ่ม QR Code ตรงนี้ ⬇️
          suffixIcon: IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.black87),
            onPressed: _showScanOptions,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildRunningJobCard(BuildContext context, DbDocument doc) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (doc.status) {
      case 1:
        statusColor = Colors.orange;
        statusText = 'Running';
        statusIcon = Icons.play_circle_fill;
        break;
      case 2:
        statusColor = Colors.blue;
        statusText = 'Ended (Waiting Post)';
        statusIcon = Icons.stop_circle;
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Draft';
        statusIcon = Icons.edit_note;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // ✅ เปิดหน้า RunningJobDetailScreen และส่ง documentId ไปด้วย
          if (doc.documentId != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RunningJobDetailScreen(documentId: doc.documentId!),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(statusIcon, color: statusColor, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc.documentName ?? 'Untitled',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Job ID: ${doc.jobId ?? '-'}'),
                        if (doc.syncStatus == 0)
                          const Text(
                            '• Waiting Sync',
                            style: TextStyle(fontSize: 10, color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
