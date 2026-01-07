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
import 'package:bio_oee_lab/data/repositories/job_sync_repository.dart';
import 'package:bio_oee_lab/data/network/job_sync_api_service.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

class RunningJobScreen extends StatefulWidget {
  const RunningJobScreen({super.key});

  @override
  State<RunningJobScreen> createState() => _RunningJobScreenState();
}

class _RunningJobScreenState extends State<RunningJobScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isUploading = false;

  // Filter State
  // 0: Draft, 1: Running, 2: End, 3: Post, 9: Cancel, 10: Delete
  final List<int> _allStatuses = [0, 1, 2, 3, 9, 10];
  List<int> _selectedStatuses = [0, 1, 2]; // Default view

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------
  // 📸 ส่วนจัดการ QR Code
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
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      _updateSearch(result);
    }
  }

  Future<void> _scanFromGallery() async {
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

  Future<void> _handleManualUpload() async {
    setState(() {
      _isUploading = true;
    });

    try {
      final appDatabase = Provider.of<AppDatabase>(context, listen: false);
      final apiService = JobSyncApiService();
      final syncRepo = JobSyncRepository(
        appDatabase: appDatabase,
        apiService: apiService,
      );

      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? '';

      final deviceInfo = context.read<DeviceInfoService>();
      final deviceId = deviceInfo.getLoginDeviceId();

      await syncRepo.syncAllJobData(userId, deviceId);

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

  void _handleRefresh() {
    setState(() {
      // Trigger rebuild to refresh StreamBuilder
    });
  }

  Future<void> _handlePostDocument(DbDocument doc) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Post'),
        content: Text(
          'Post "${doc.documentName}"? Status will change to Post and ready for sync.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Post'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        if (!mounted) return;
        await context.read<DocumentRepository>().postDocument(doc.documentId!);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Document Posted Successfully')),
          );
        }
      } catch (e) {
        if (mounted) {
          _showError('Error posting document: $e');
        }
      }
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Filter Status'),
              content: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _allStatuses.map((status) {
                  final isSelected = _selectedStatuses.contains(status);
                  return FilterChip(
                    label: Text(_getStatusLabel(status)),
                    selected: isSelected,
                    onSelected: (selected) {
                      setStateDialog(() {
                        if (selected) {
                          _selectedStatuses.add(status);
                        } else {
                          _selectedStatuses.remove(status);
                        }
                      });
                    },
                    backgroundColor: _getStatusColor(status).withOpacity(0.1),
                    selectedColor: _getStatusColor(status).withOpacity(0.3),
                    checkmarkColor: _getStatusColor(status),
                    labelStyle: TextStyle(
                      color: _getStatusColor(status),
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // Reset to default
                    setStateDialog(() {
                      _selectedStatuses = [0, 1, 2];
                    });
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    setState(() {}); // Refresh Main Screen
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getStatusLabel(int status) {
    switch (status) {
      case 0:
        return 'Draft';
      case 1:
        return 'Running';
      case 2:
        return 'End';
      case 3:
        return 'Post';
      case 9:
        return 'Cancel';
      case 10:
        return 'Delete';
      default:
        return 'Unknown';
    }
  }

  Color _getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.grey;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.purple;
      case 9:
        return Colors.red;
      case 10:
        return Colors.black;
      default:
        return Colors.grey;
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
        title: const Text('Running Jobs'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: _buildSearchBar(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _handleRefresh,
          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showBatchActions,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.flash_on),
      ),
      body: StreamBuilder<List<DbDocument>>(
        stream: documentRepo.watchActiveDocuments(
          userId,
          query: _searchQuery,
          statusFilter: _selectedStatuses,
        ),
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
                        ? 'No jobs found.'
                        : 'No result for "$_searchQuery"',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Filters: ${_selectedStatuses.map((e) => _getStatusLabel(e)).join(", ")}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            padding: const EdgeInsets.only(
              bottom: 80,
              left: 8,
              right: 8,
              top: 8,
            ),
            itemBuilder: (context, index) {
              final doc = docs[index];
              return _buildRunningJobCard(context, doc);
            },
          );
        },
      ),
    );
  }

  void _showBatchActions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Quick Actions (Stats All Jobs)',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.restaurant, color: Colors.orange),
                title: const Text('Lunch Break'),
                subtitle: const Text('Pause all jobs for lunch'),
                onTap: () => _performBatchAction('Lunch', 'Lunch Break'),
              ),
              ListTile(
                leading: const Icon(Icons.coffee, color: Colors.brown),
                title: const Text('Short Break'),
                subtitle: const Text('Pause all jobs for a break'),
                onTap: () => _performBatchAction('Break', 'Short Break'),
              ),
              ListTile(
                leading: const Icon(Icons.groups, color: Colors.blue),
                title: const Text('Meeting'),
                subtitle: const Text('Pause all jobs for meeting'),
                onTap: () => _performBatchAction('Meeting', 'Meeting'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.green,
                ),
                title: const Text('Resume Work'),
                subtitle: const Text('Resume all previously paused jobs'),
                onTap: _performBatchResume,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _performBatchAction(String type, String remark) async {
    Navigator.pop(context);
    try {
      final repo = context.read<DocumentRepository>();
      final userId = context.read<LoginRepository>().loggedInUser?.userId ?? '';

      await repo.batchPauseJobs(
        userId: userId,
        activityType: type,
        remark: remark,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('All jobs paused for $type')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _performBatchResume() async {
    Navigator.pop(context);
    try {
      final repo = context.read<DocumentRepository>();
      final userId = context.read<LoginRepository>().loggedInUser?.userId ?? '';

      final count = await repo.batchResumeJobs(userId);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Resumed $count jobs.')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
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
          // Filter Icon
          suffixIcon: Row(
            // Use Row for multiple icons
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.blue),
                onPressed: _showFilterDialog,
                tooltip: 'Filter Status',
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner, color: Colors.black87),
                onPressed: _showScanOptions,
              ),
            ],
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
    final statusColor = _getStatusColor(doc.status);
    final statusText = _getStatusLabel(doc.status);

    IconData statusIcon;
    switch (doc.status) {
      case 1:
        statusIcon = Icons.play_circle_fill;
        break;
      case 2:
        statusIcon = Icons.stop_circle;
        break;
      case 3:
        statusIcon = Icons.cloud_done;
        break;
      case 9:
        statusIcon = Icons.cancel;
        break;
      default:
        statusIcon = Icons.edit_note;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
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
                      color: statusColor.withOpacity(0.1),
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
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.orange,
                            ), // Changed color
                          ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                      // Post Button (Only for End=2)
                      if (doc.status == 2)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: OutlinedButton.icon(
                            onPressed: () => _handlePostDocument(doc),
                            icon: const Icon(Icons.send, size: 14),
                            label: const Text(
                              'Post',
                              style: TextStyle(fontSize: 12),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.purple,
                              visualDensity: VisualDensity.compact,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                            ),
                          ),
                        ),
                    ],
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
