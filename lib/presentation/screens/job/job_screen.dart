// lib/presentation/screens/job/job_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/repositories/job_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

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
  final TextEditingController _manualJobNameController =
      TextEditingController();
  String _searchQuery = '';
  bool _showManualOnly = false; // Default: Show All
  bool _showMyAssignments = true; // Default: Show My Jobs
  bool _showRunning = false; // Default: Show All (not just running)

  @override
  void dispose() {
    _searchController.dispose();
    _manualJobNameController.dispose();
    super.dispose();
  }

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
        _showError('Error scanning image: $e');
      } finally {
        controller.dispose();
      }
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

  Future<void> _handleSync() async {
    final loginRepo = context.read<LoginRepository>();
    final syncRepo = context.read<SyncRepository>();

    final userId = loginRepo.loggedInUser?.userId ?? '';
    if (userId.isEmpty) return;

    if (!mounted) return;

    // Show Progress Dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Consumer<SyncRepository>(
          builder: (context, repository, child) {
            String statusText = repository.lastSyncMessage;
            bool isSyncing = repository.syncStatus == SyncStatus.syncing;
            bool isSuccess = repository.syncStatus == SyncStatus.success;
            bool isFailure = repository.syncStatus == SyncStatus.failure;

            if (isSuccess) {
              Future.delayed(const Duration(seconds: 1), () {
                if (Navigator.canPop(dialogContext)) {
                  Navigator.pop(dialogContext);
                }
              });
            }

            return AlertDialog(
              title: Text(
                isFailure
                    ? 'Sync Failed'
                    : isSuccess
                    ? 'Sync Complete'
                    : 'Syncing Data',
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSyncing) const LinearProgressIndicator(),
                  if (isSyncing || isSuccess) const SizedBox(height: 16),
                  Text(statusText),
                  if (isFailure) ...[
                    const SizedBox(height: 16),
                    const Icon(Icons.error, color: Colors.red, size: 48),
                  ] else if (isSuccess) ...[
                    const SizedBox(height: 16),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 48,
                    ),
                  ],
                ],
              ),
              actions: [
                if (!isSyncing)
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Close'),
                  ),
              ],
            );
          },
        );
      },
    );

    // Run the synchronized process
    await syncRepo.syncJobScreenData(userId);
  }

  void _onStartJobPressed(BuildContext context, DbJob job) async {
    final documentRepo = context.read<DocumentRepository>();
    final loginRepo = context.read<LoginRepository>();
    final db = context.read<AppDatabase>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    try {
      final newDocId = await documentRepo.createDocumentFromJob(
        job: job,
        userId: userId,
      );

      if (job.oeeJobId != null) {
        final testItems = await db.jobTestItemDao.getItemsByOeeJobId(
          job.oeeJobId!,
        );
        for (final item in testItems) {
          final code = item.testItemId ?? item.testItemName ?? 'Unknown';
          await documentRepo.addTestSetByQrCode(
            documentId: newDocId,
            qrCode: code,
            userId: userId,
            rowId: item.rowId,
            oeeJobId: job.oeeJobId, // <<< Fix: Add oeeJobId
            testItemName: item.testItemName,
          );
        }
      }

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

  Future<void> _showCreateManualJobDialog() async {
    final loginRepo = context.read<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? 'User';

    // Default Job Name: UserId-yyyyMMddHHmmss
    final now = DateTime.now();
    final defaultJobName =
        '$userId-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';

    _manualJobNameController.text = defaultJobName;

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Create Manual Job'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _manualJobNameController,
                decoration: const InputDecoration(
                  labelText: 'Job Name',
                  hintText: 'Enter Job Name',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Note: Machine & Location will be empty.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_manualJobNameController.text.isNotEmpty) {
                  Navigator.pop(ctx);
                  _createManualJob(_manualJobNameController.text, userId);
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  // ✅ Delete Manual Job Handler
  void _handleDeleteJob(DbJob job) async {
    if (job.jobId == null) return;

    final documentRepo = context.read<DocumentRepository>();
    final jobRepo = context.read<JobRepository>();

    // 1. Check for documents (History)
    // The user wants to allow deletion EVEN IF history exists.
    // So we just warn them that history will be deleted too.
    final hasDocs = await documentRepo
        .watchActiveDocCountByJob(job.createBy ?? '', job.jobId!)
        .first;

    // Double check: ask confirmation with warning if needed
    if (!mounted) return;

    final warningMsg = hasDocs > 0
        ? '\n\n⚠️ Warning: This job has running history/documents. Deleting it will PERMANENTLY DELETE all associated documents!'
        : '';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text(
          'Are you sure you want to delete "${job.jobName}"?$warningMsg\nThis cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx); // Close Confirm

              // 2. Cascade Delete: Delete Documents first
              await documentRepo.deleteDocumentsByJobId(job.jobId!);

              // 3. Delete Job
              await jobRepo.deleteManualJob(job.jobId!);

              if (mounted) {
                Navigator.of(context).pop(); // Close Details Dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Job and associated documents deleted successfully.',
                    ),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _createManualJob(String jobName, String userId) {
    // Generate a GUID for manual job (Simulated)
    final jobId = DateTime.now().millisecondsSinceEpoch
        .toString(); // Using timestamp as simple unique ID for now, or use uuid package if available

    final newJob = DbJob(
      uid: 0, // Auto-increment
      jobId: jobId,
      jobName: jobName,
      machineName: '',
      location: '',
      jobStatus: 0,
      isManual: true,
      createDate: DateTime.now().toIso8601String(),
      createBy: userId,
      documentId: jobId, // Using same unique ID
      isSynced: false, // Manual jobs start as unsynced
      recordVersion: 0,
    );

    context.read<JobRepository>().createManualJob(newJob);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Manual Job "$jobName" created.')));
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
        title: const Text('All Jobs'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: _buildSearchBar(),
              ),
              // Filter Toggle Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    // Filter: My Assignments
                    FilterChip(
                      label: const Text('My Assignments'),
                      selected: _showMyAssignments,
                      onSelected: (bool selected) {
                        setState(() {
                          _showMyAssignments = selected;
                        });
                      },
                      checkmarkColor: Colors.white,
                      selectedColor: Colors.blue.shade300,
                    ),
                    const SizedBox(width: 8),

                    // Filter: Running
                    FilterChip(
                      label: const Text('Running'),
                      selected: _showRunning,
                      onSelected: (bool selected) {
                        setState(() {
                          _showRunning = selected;
                        });
                      },
                      checkmarkColor: Colors.white,
                      selectedColor: Colors.orange.shade300,
                    ),
                    const SizedBox(width: 8),

                    // Filter: Manual Only
                    FilterChip(
                      label: const Text('Manual Only'),
                      selected: _showManualOnly,
                      onSelected: (bool selected) {
                        setState(() {
                          _showManualOnly = selected;
                        });
                      },
                      checkmarkColor: Colors.white,
                      selectedColor: Colors.green.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Create Manual Job',
            onPressed: _showCreateManualJobDialog,
          ),
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
            onPressed: isSyncing ? null : _handleSync,
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
          if (isSyncing) ...[
            LinearProgressIndicator(
              value: null,
              backgroundColor: Colors.grey[200],
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                jobRepo.syncMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ),
          ],

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
              stream: jobRepo.watchJobs(
                query: _searchQuery,
                isManual: _showManualOnly ? true : null,
                filterAssignmentId: _showRunning
                    ? null
                    : (_showMyAssignments ? userId : null),
                filterRunningByUserId: _showRunning ? userId : null,
              ),
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
                              ? (_showManualOnly
                                    ? 'No Manual Jobs Found'
                                    : 'No Jobs Found')
                              : 'No result for "$_searchQuery"',
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _handleSync,
                          child: const Text('Sync Now'),
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: _showCreateManualJobDialog,
                          icon: const Icon(Icons.add),
                          label: const Text('Create Manual Job'),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
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
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: job.isManual
                                  ? Colors.blue
                                  : (job.jobStatus == 1
                                        ? Colors.green
                                        : Colors.orange),
                              child: Icon(
                                job.isManual ? Icons.edit_note : Icons.work,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              // Show SampleNo as title, fallback to JobName
                              (job.sampleNo != null && job.sampleNo!.isNotEmpty)
                                  ? job.sampleNo!
                                  : (job.jobName ?? 'Unknown Job'),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Job Name: ${job.jobName ?? '-'}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Plan: ${job.planAnalysisDate?.split('T').first ?? '-'}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.assignment_ind,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Assign: ${job.assignmentId ?? '-'}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Sample: ${job.sampleName ?? '-'}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'LOT: ${job.lotNo ?? '-'}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  if (job.isManual)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.blue.shade200,
                                        ),
                                      ),
                                      child: const Text(
                                        'Manual',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  if (job.isManual) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          job.isSynced
                                              ? Icons.cloud_done
                                              : Icons.cloud_upload,
                                          size: 14,
                                          color: job.isSynced
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          job.isSynced
                                              ? 'Synced'
                                              : 'Pending Sync',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: job.isSynced
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            trailing: const Icon(
                              // Keep trailing icon if navigation needed
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {
                              _showJobDetailsDialog(job);
                            },
                          ),

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
    );
  }

  Future<void> _showJobDetailsDialog(DbJob job) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  job.jobName ?? 'Job Details',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15, // Adjusted font size
                  ),
                  maxLines: 2, // Allow wrapping
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Action Buttons (Manual Jobs Only)
                  if (job.isManual) ...[
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Delete Job',
                      onPressed: () => _handleDeleteJob(job),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.pop(ctx);
                        _handleRenameJob(job);
                      },
                      tooltip: 'Rename Job',
                    ),
                  ],
                ],
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Sample No', job.sampleNo ?? job.jobName ?? '-'),
              _buildDetailRow('Job Name', job.jobName ?? '-'),
              _buildDetailRow('Sample Name', job.sampleName ?? '-'),
              _buildDetailRow('LOT NO', job.lotNo ?? '-'),
              _buildDetailRow(
                'Plan Date',
                job.planAnalysisDate?.split('T').first ?? '-',
              ),
              _buildDetailRow('Assignment ID', job.assignmentId ?? '-'),
              _buildDetailRow('Machine', job.machineName ?? '-'),
              _buildDetailRow('Location', job.location ?? '-'),
              _buildDetailRow('Status', job.jobStatus.toString()),
              if (job.isManual)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        job.isSynced ? Icons.cloud_done : Icons.cloud_upload,
                        size: 16,
                        color: job.isSynced ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        job.isSynced ? 'Synced with Server' : 'Pending Upload',
                        style: TextStyle(
                          color: job.isSynced ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Close'),
            ),
            // Start Job Button (if not started)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                _onStartJobPressed(context, job);
              },
              child: const Text('Start Job'),
            ),
          ],
        );
      },
    );
  }

  // ✅ Rename Job Handler
  Future<void> _handleRenameJob(DbJob job) async {
    final controller = TextEditingController(text: job.jobName);
    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename Job'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New Job Name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (newName != null && newName.isNotEmpty && newName != job.jobName) {
      if (!mounted) return;
      try {
        final repo = context.read<DocumentRepository>();
        if (job.jobId != null) {
          await repo.renameJob(job.jobId!, newName);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Job renamed successfully')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error renaming: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0), // Increased spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // Increased width for longer labels like Assignment ID
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
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
          hintText: 'Search Job...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
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
}
