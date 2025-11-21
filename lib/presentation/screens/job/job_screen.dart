import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io'; // 1. เพิ่ม import นี้เพื่อเช็ค Platform
import 'package:flutter/foundation.dart'; // 2. เพิ่ม import นี้เพื่อเช็ค kIsWeb
import 'package:bio_oee_lab/data/repositories/job_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart'; // สำหรับ active count
import 'package:bio_oee_lab/data/database/app_database.dart';

// Import สำหรับ QR Scan
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------
  // 📸 ส่วนจัดการ QR Code (กล้อง & รูปภาพ)
  // ---------------------------------------------------------

  /// 1. เมนูเลือก: สแกนกล้อง หรือ เอารูปจากเครื่อง
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

  /// 2. เปิดกล้องสแกน (ไปหน้า ScannerScreen)
  Future<void> _scanFromCamera() async {
    // เปิดหน้าสแกนที่เราสร้างไว้ด้านล่าง (ScannerScreen)
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      _updateSearch(result);
    }
  }

  /// 3. เลือกรูปจาก Gallery มาสแกน
  Future<void> _scanFromGallery() async {
    if (kIsWeb ||
        (!Platform.isAndroid && !Platform.isIOS && !Platform.isMacOS)) {
      _showError(
        'ฟีเจอร์ "สแกนจากรูปภาพ" รองรับเฉพาะบนมือถือ (Android/iOS) เท่านั้น',
      );
      return;
    }

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // ใช้ MobileScannerController เพื่อวิเคราะห์รูปภาพ
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
        _showError('Error scanning image: $e');
      } finally {
        controller.dispose();
      }
    }
  }

  /// Helper: อัปเดตช่องค้นหาเมื่อได้ผลลัพธ์
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

  Future<void> _handleSync(BuildContext context) async {
    final jobRepo = context.read<JobRepository>();
    final loginRepo = context.read<LoginRepository>();

    final userId = loginRepo.loggedInUser?.userId ?? '';
    if (userId.isEmpty) return;

    await jobRepo.syncJobs(userId);

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(jobRepo.syncMessage)));
    }
  }

  void _onStartJobPressed(BuildContext context, DbJob job) async {
    // ... (โค้ดเดิม: Start Job) ...
    final documentRepo = context.read<DocumentRepository>();
    final loginRepo = context.read<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    try {
      await documentRepo.createDocumentFromJob(job: job, userId: userId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Job "${job.jobName}" added to Running list!'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error starting job: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleClaimJob() {
    // ... (โค้ดเดิม: Claim Job) ...
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Claim Job'),
        content: const Text(
          'This feature requires online connection.\n(Enter Job ID to claim from other users)',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobRepo = context.watch<JobRepository>();
    final loginRepo = context.watch<LoginRepository>();
    final documentRepo = context.watch<DocumentRepository>();

    final userId = loginRepo.loggedInUser?.userId ?? '';
    final isSyncing = jobRepo.status == JobSyncStatus.syncing;

    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(), // ใช้ Search Bar ที่อัปเดตแล้ว
        actions: [
          IconButton(
            icon: isSyncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.sync),
            onPressed: isSyncing ? null : () => _handleSync(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<LoginRepository>().logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isSyncing)
            LinearProgressIndicator(
              value: null,
              backgroundColor: Colors.grey[200],
            ),

          // --- Active Running Jobs Bar ---
          if (userId.isNotEmpty)
            StreamBuilder<int>(
              stream: documentRepo.watchActiveDocCount(userId),
              initialData: 0,
              builder: (context, snapshot) {
                final count = snapshot.data ?? 0;
                if (count == 0) return const SizedBox.shrink();

                return Container(
                  width: double.infinity,
                  color: Colors.orange.shade100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.run_circle_outlined,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Active Running Jobs:',
                        style: TextStyle(
                          color: Colors.orange.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                );
              },
            ),

          Expanded(
            child: StreamBuilder<List<DbJob>>(
              stream: jobRepo.watchJobs(_searchQuery),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final jobs = snapshot.data!;
                if (jobs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.work_off,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No Jobs Found'
                              : 'No result for "$_searchQuery"',
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => _handleSync(context),
                          child: const Text('Sync Now'),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: job.jobStatus == 1
                                  ? Colors.green
                                  : Colors.orange,
                              child: const Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              job.jobName ?? 'Unknown Job',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Job ID: ${job.jobId ?? '-'}'),
                                Text('Machine: ${job.machineName ?? '-'}'),
                                Text('Location: ${job.location ?? '-'}'),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {
                              // TODO: Navigate logic
                            },
                          ),

                          // Action Bar
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: [
                                if (userId.isNotEmpty && job.jobId != null)
                                  StreamBuilder<int>(
                                    stream: documentRepo
                                        .watchActiveDocCountByJob(
                                          userId,
                                          job.jobId!,
                                        ),
                                    initialData: 0,
                                    builder: (context, snapshot) {
                                      final count = snapshot.data ?? 0;
                                      if (count == 0)
                                        return const SizedBox.shrink();
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade50,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: Colors.orange.shade200,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.timelapse,
                                              size: 14,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '$count Running',
                                              style: TextStyle(
                                                color: Colors.orange.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                const Spacer(),
                                OutlinedButton.icon(
                                  icon: const Icon(Icons.play_arrow),
                                  label: const Text("Start Job"),
                                  onPressed: () =>
                                      _onStartJobPressed(context, job),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleClaimJob,
        label: const Text('Claim Job'),
        icon: const Icon(Icons.add_task),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  // --- Widget Search Bar ที่ปรับปรุงแล้ว ---
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
          hintText: 'Search Job...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          // ⬇️ เพิ่มปุ่ม QR Code ตรงนี้ ⬇️
          suffixIcon: IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.black87),
            onPressed: _showScanOptions, // เรียกเมนูเลือก
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
}
