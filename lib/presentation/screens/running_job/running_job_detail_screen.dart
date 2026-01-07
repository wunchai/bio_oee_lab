import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/machine_detail_screen.dart';
import 'package:drift/drift.dart' hide Column;

class RunningJobDetailScreen extends StatefulWidget {
  final String documentId;

  const RunningJobDetailScreen({super.key, required this.documentId});

  @override
  State<RunningJobDetailScreen> createState() => _RunningJobDetailScreenState();
}

class _RunningJobDetailScreenState extends State<RunningJobDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _remarkController = TextEditingController();

  DbJobTestSet? _selectedTestSet;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadInitialTestSet();
  }

  Future<void> _loadInitialTestSet() async {
    // Wait for frame to ensure context is available (though strictly not needed for Provider listen:false)
    await Future.delayed(Duration.zero);
    if (!mounted) return;

    final db = context.read<AppDatabase>();
    // Get latest test set (first one)
    final testSets = await db.runningJobDetailsDao
        .watchTestSetsByDocId(widget.documentId)
        .first;

    if (testSets.isNotEmpty && mounted) {
      setState(() {
        _selectedTestSet = testSets.first;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------
  // 🛠️ Action Logic
  // -------------------------------------------------------

  Future<void> _performAction({
    required String activityType, // ID
    String? activityName, // Name
    required int newStatus,
    String label = 'Action',
    String? jobTestSetId,
  }) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.handleUserAction(
        documentId: widget.documentId,
        userId: userId,
        activityType: activityType,
        activityName: activityName,
        newDocStatus: newStatus,
        jobTestSetId: jobTestSetId,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label Successful')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // ✅ 1. Helper Function: บันทึกลง Database (ใช้ร่วมกันทั้ง Scan และ Manual)
  Future<void> _saveTestSet(String code) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addTestSetByQrCode(
        documentId: widget.documentId,
        qrCode: code,
        userId: userId,
      );

      // Auto-select the newly added test set
      await _loadInitialTestSet();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Test Set Added: $code')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // ✅ 2. ฟังก์ชัน Scan QR (ปรับปรุงให้เรียก _saveTestSet)
  Future<void> _handleScanTestSet() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      await _saveTestSet(result);
    }
  }

  // ✅ 3. ฟังก์ชัน Manual Input (ใหม่! ⭐)
  Future<void> _handleManualInputTestSet() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Test Set (Manual)'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Test Set No.',
            hintText: 'Type ID here...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.keyboard),
          ),
          autofocus: true, // ให้เด้งคีย์บอร์ดขึ้นมาเลย
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      await _saveTestSet(result);
    }
  }

  // ✅ 6. ฟังก์ชัน Rename Job (ใหม่! ⭐)
  Future<void> _handleRenameJob(String currentName) async {
    final controller = TextEditingController(text: currentName);
    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename Job'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Job Name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.edit),
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

    if (newName != null && newName.isNotEmpty && newName != currentName) {
      try {
        final repo = context.read<DocumentRepository>();
        final db = context.read<AppDatabase>();

        final doc = await db.documentDao.getDocumentById(widget.documentId);
        if (doc != null && doc.jobId != null) {
          await repo.renameJob(doc.jobId!, newName);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Job Renamed successfully')),
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

  // ✅ 4. ฟังก์ชัน Switch Activity (Updated)
  Future<void> _handleSwitchActivity(BuildContext context) async {
    // 1. Use selected test set or prompt
    DbJobTestSet? targetTestSet = _selectedTestSet;

    if (targetTestSet == null) {
      targetTestSet = await _showTestSetSelectionDialog(context);
      if (targetTestSet != null) {
        setState(() {
          _selectedTestSet = targetTestSet;
        });
      }
    }

    if (targetTestSet == null) return; // Still null means cancelled

    // 2. Select Activity (Filter by TestSet)
    final activityObj = await _showActivitySelectionDialog(
      context,
      'Switch Activity',
      testSetId: targetTestSet.recId,
    );

    if (activityObj != null) {
      await _performAction(
        activityType: activityObj.activityCode ?? 'Unknown',
        activityName: activityObj.activityName,
        newStatus: 1, // Keep Running
        label: 'Switched to ${activityObj.activityName}',
        jobTestSetId: targetTestSet.recId,
      );
    }
  }

  // ✅ 5. ฟังก์ชัน Start/Resume with Activity Selection (ใหม่! ⭐)
  Future<void> _handleStartOrResumeWithActivity(
    BuildContext context,
    String label,
  ) async {
    // 1. Use selected test set or prompt
    DbJobTestSet? targetTestSet = _selectedTestSet;

    if (targetTestSet == null) {
      targetTestSet = await _showTestSetSelectionDialog(context);
      if (targetTestSet != null) {
        setState(() {
          _selectedTestSet = targetTestSet;
        });
      }
    }

    if (targetTestSet == null) return; // Cancelled

    // 2. Select Activity
    final activityObj = await _showActivitySelectionDialog(
      context,
      '$label Activity',
      testSetId: targetTestSet.recId,
    );

    if (activityObj != null) {
      await _performAction(
        activityType: activityObj.activityCode ?? 'Unknown',
        activityName: activityObj.activityName,
        newStatus: 1,
        label: label,
        jobTestSetId: targetTestSet.recId,
      );
    }
  }

  // Helper: Show Dialog to Select Test Set
  Future<DbJobTestSet?> _showTestSetSelectionDialog(
    BuildContext context,
  ) async {
    final db = Provider.of<AppDatabase>(context, listen: false);

    // Fetch Active Test Sets
    final testSets = await db.runningJobDetailsDao
        .watchTestSetsByDocId(widget.documentId)
        .first;

    if (testSets.isEmpty) {
      // If no test sets, maybe show alert or just proceed with null?
      // User requirement: "เลือก Test Set ก่อน" implies required.
      // But if there are no test sets, we can't work?
      // Let's prompt user to add one or allow null (Global)?
      // For strictness, let's warn.
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No Test Sets found. Please add one first.'),
          ),
        );
      }
      return null;
    }

    if (!mounted) return null;

    return showDialog<DbJobTestSet>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Select Test Set'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: testSets.length,
              itemBuilder: (context, index) {
                final ts = testSets[index];
                return ListTile(
                  title: Text('Test Set: ${ts.setItemNo ?? '-'}'),
                  onTap: () => Navigator.pop(ctx, ts),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, null),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Helper: Show Dialog to Select or Create Activity
  Future<DbHumanActivityType?> _showActivitySelectionDialog(
    BuildContext context,
    String title, {
    String? testSetId,
  }) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final loginRepo = Provider.of<LoginRepository>(context, listen: false);
    final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

    // Seed default activities if empty for THIS document
    await db.humanActivityTypeDao.seedDefaultActivities(
      widget.documentId,
      userId,
    );

    // Filter by document AND testSetId (optional)
    final activities = await db.humanActivityTypeDao.getActiveActivities(
      widget.documentId,
      testSetRecId: testSetId,
    );

    if (!mounted) return null;

    String? selectedActivityCode;
    final textController = TextEditingController(); // For new activity name

    return showDialog<DbHumanActivityType?>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select activity:'),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Choose activity...'),
                      value: selectedActivityCode,
                      items: activities
                          .map(
                            (a) => DropdownMenuItem(
                              value: a.activityCode,
                              child: Text(a.activityName ?? '-'),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedActivityCode = val;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const Text(
                      'Or create new:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: 'New Activity Name',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, null),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Check if creating new
                    final newName = textController.text.trim();
                    if (newName.isNotEmpty) {
                      // Create new activity
                      final code =
                          'CUSTOM_${DateTime.now().millisecondsSinceEpoch}';
                      final now = DateTime.now().toIso8601String();

                      await db.humanActivityTypeDao.insertActivity(
                        HumanActivityTypesCompanion.insert(
                          documentId: Value(widget.documentId),
                          userId: Value(userId),
                          activityCode: Value(code),
                          activityName: Value(newName),
                          status: const Value(1),
                          recId: Value(code),
                          updatedAt: Value(now),
                          lastSync: const Value(null),
                          syncStatus: const Value(0),
                          recordVersion: const Value(0),
                          jobTestSetRecId: Value(testSetId), // Save Test Set ID
                        ),
                      );

                      // Fetch newly created to return it
                      final newActivity = DbHumanActivityType(
                        uid: 0, // Placeholder, actual UID managed by DB
                        recId: code,
                        documentId: widget.documentId,
                        userId: userId,
                        activityCode: code,
                        activityName: newName,
                        status: 1,
                        updatedAt: now,
                        syncStatus: 0,
                        recordVersion: 0,
                        jobTestSetRecId: testSetId,
                      );
                      if (context.mounted) Navigator.pop(ctx, newActivity);
                    } else if (selectedActivityCode != null) {
                      // Return selected
                      final selected = activities.firstWhere(
                        (a) => a.activityCode == selectedActivityCode,
                      );
                      Navigator.pop(ctx, selected);
                    }
                  },
                  child: const Text('Select'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _handlePause() async {
    // 1. เตรียมข้อมูล
    final db = Provider.of<AppDatabase>(context, listen: false);
    // (Optional: Seed ข้อมูลถ้ายังไม่มี เพื่อให้เทสได้เลย)
    await db.pauseReasonDao.seedDefaultReasons();

    // ดึงรายการเหตุผล
    final reasons = await db.pauseReasonDao.getActiveReasons();

    // ตัวแปรเก็บค่าที่เลือก
    String? selectedReason;

    // 2. แสดง Dialog
    final shouldPause = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          // ใช้ StatefulBuilder เพื่อให้ Dropdown อัปเดตค่าได้ใน Dialog
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Pause Job'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select reason:'),
                    const SizedBox(height: 10),
                    if (reasons.isEmpty)
                      const Text(
                        'No reasons defined in Master Data.',
                        style: TextStyle(color: Colors.red),
                      )
                    else
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                        ),
                        hint: const Text('Choose a reason...'),
                        value: selectedReason,
                        items: reasons
                            .map(
                              (r) => DropdownMenuItem(
                                value: r.reasonName,
                                child: Text(r.reasonName ?? '-'),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedReason = val;
                          });
                        },
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  // ต้องเลือกเหตุผลก่อนถึงจะกดได้ (หรือจะยอมให้ว่างก็ได้แล้วแต่ Logic)
                  onPressed: selectedReason == null
                      ? null
                      : () => Navigator.pop(ctx, true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Pause'),
                ),
              ],
            );
          },
        );
      },
    );

    // 3. ถ้ากดตกลง บันทึกข้อมูล
    if (shouldPause == true && selectedReason != null) {
      // Find selected reason object
      final reasonObj = reasons.firstWhere(
        (r) => r.reasonName == selectedReason,
      );

      await _performAction(
        activityType: 'PAUSE_${reasonObj.reasonCode}', // Prefix with PAUSE_
        activityName: reasonObj.reasonName, // Use Name
        newStatus: 1,
        label: 'Pause',
        jobTestSetId:
            null, // Pause doesn't necessarily belong to a TestSet? Or use last? Global pause usually.
      );
    }
  }

  Future<void> _handleEnd() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('End Job'),
        content: const Text('Are you sure you want to finish this job?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirm End'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _performAction(
        activityType: 'End',
        activityName: 'End Job',
        newStatus: 2,
        label: 'End Job',
      );
    }
  }

  // -------------------------------------------------------
  // 🎨 UI Construction
  // -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Detail'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.access_time), text: 'Work & Time'),
            Tab(icon: Icon(Icons.science), text: 'Test Sets'),
            Tab(icon: Icon(Icons.precision_manufacturing), text: 'Machines'),
          ],
        ),
      ),
      body: StreamBuilder<DbDocument?>(
        stream: db.documentDao.watchDocumentById(widget.documentId),
        builder: (context, docSnapshot) {
          if (!docSnapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final doc = docSnapshot.data;
          if (doc == null)
            return const Center(child: Text('Document not found'));

          return Column(
            children: [
              // 1. Header Info (แสดงตลอด)
              _buildHeader(doc),

              // 2. Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Work Timeline & Controls
                    _buildWorkTab(db, doc),

                    // Tab 2: Test Sets List
                    _buildTestSetsTab(db),

                    // Tab 3: Machines List
                    _buildMachinesTab(db),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader(DbDocument doc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(bottom: BorderSide(color: Colors.blue.shade100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _handleRenameJob(doc.documentName ?? ''),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          doc.documentName ?? 'Untitled',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.edit, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Job ID: ${doc.jobId}',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          _buildStatusBadge(doc.status),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(int status) {
    Color color;
    String text;
    switch (status) {
      case 0:
        color = Colors.grey;
        text = 'Draft';
        break;
      case 1:
        color = Colors.orange;
        text = 'Running';
        break;
      case 2:
        color = Colors.blue;
        text = 'Ended';
        break;
      case 3:
        color = Colors.green;
        text = 'Posted';
        break;
      default:
        color = Colors.red;
        text = 'Unknown';
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String? _timelineFilterTestSetId;

  // --- Tab 1: Work & Time ---
  Widget _buildWorkTab(AppDatabase db, DbDocument doc) {
    // 1. Fetch Test Sets to populate Filter & Map Names
    return StreamBuilder<List<DbJobTestSet>>(
      stream: db.runningJobDetailsDao.watchTestSetsByDocId(widget.documentId),
      builder: (context, testSetsSnapshot) {
        final testSets = testSetsSnapshot.data ?? [];

        // Map ID -> Name for easy lookup
        final Map<String, String> testSetMap = {
          for (var ts in testSets) ts.recId: ts.setItemNo ?? 'Unknown',
        };

        // 2. Fetch Logs
        return StreamBuilder<List<DbJobWorkingTime>>(
          stream: db.runningJobDetailsDao.watchUserLogs(widget.documentId),
          builder: (context, logsSnapshot) {
            var logs = logsSnapshot.data ?? [];

            // 3. Apply Filter
            if (_timelineFilterTestSetId != null) {
              logs = logs.where((l) {
                // If filtering by a specific ID, match it.
                // Note: Some global activities (like Pause) might have null testSetId.
                // Usually we only show what matches.
                return l.jobTestSetRecId == _timelineFilterTestSetId;
              }).toList();
            }

            // 4. Find Current Status (for buttons)
            // (Original logic to find currentLog, isWorking, etc.)
            // We must use the UNFILTERED list to determine current state correctly!
            // Wait, if we filter the view, controls should still reflect the actual job state.
            // So let's re-fetch the *full* recent log for state logic.
            final fullLogs = logsSnapshot.data ?? [];

            final currentLog = fullLogs.isEmpty
                ? null
                : fullLogs.firstWhere(
                    (l) => l.endTime == null,
                    orElse: () => fullLogs.first,
                  );

            final bool hasOpenLog =
                currentLog != null && currentLog.endTime == null;

            final bool isPaused =
                hasOpenLog &&
                (currentLog.activityId?.startsWith('PAUSE_') ?? false);

            final bool isWorking = hasOpenLog && !isPaused;
            final bool isEnded = doc.status == 2;

            return Column(
              children: [
                // Control Buttons (Always visible)
                if (!isEnded)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: !isWorking && !isPaused
                              ? _buildBigButton(
                                  'START WORK',
                                  Colors.green,
                                  Icons.play_arrow,
                                  () => _handleStartOrResumeWithActivity(
                                    context,
                                    'Start',
                                  ),
                                )
                              : isPaused
                              ? _buildBigButton(
                                  'RESUME',
                                  Colors.green,
                                  Icons.play_arrow,
                                  () => _handleStartOrResumeWithActivity(
                                    context,
                                    'Resume',
                                  ),
                                )
                              : _buildBigButton(
                                  'PAUSE',
                                  Colors.orange,
                                  Icons.pause,
                                  _handlePause,
                                ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBigButton(
                            'END JOB',
                            Colors.red,
                            Icons.stop,
                            _handleEnd,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Switch Activity & Selector (Only when Working)
                if (isWorking)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: [
                        // Switch Activity Button
                        Expanded(
                          flex: 3,
                          child: OutlinedButton.icon(
                            onPressed: () => _handleSwitchActivity(context),
                            icon: const Icon(Icons.swap_horiz),
                            label: const Text('Switch Activity'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Test Set Selector
                        Expanded(
                          flex: 2,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final selected =
                                  await _showTestSetSelectionDialog(context);
                              if (selected != null) {
                                setState(() {
                                  _selectedTestSet = selected;
                                });
                              }
                            },
                            icon: const Icon(Icons.science),
                            label: Text(
                              _selectedTestSet?.setItemNo ?? 'Select Set',
                              overflow: TextOverflow.ellipsis,
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                const Divider(),

                // Filter Control Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.grey.shade50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Filter by:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          value: _timelineFilterTestSetId,
                          underline: Container(), // Remove underline
                          hint: const Text('All Test Sets'),
                          items: [
                            const DropdownMenuItem<String?>(
                              value: null,
                              child: Text('Show All'),
                            ),
                            ...testSets.map((ts) {
                              return DropdownMenuItem<String?>(
                                value: ts.recId,
                                child: Text(
                                  'Test Set: ${ts.setItemNo}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _timelineFilterTestSetId = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // Timeline List
                Expanded(
                  child: logs.isEmpty
                      ? Center(
                          child: Text(
                            _timelineFilterTestSetId == null
                                ? 'No activity recorded yet.'
                                : 'No activities found for this Test Set.',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: logs.length,
                          itemBuilder: (context, index) {
                            final log = logs[index];
                            final isWork =
                                !(log.activityId?.startsWith('PAUSE_') ??
                                    false);
                            final start = DateTime.tryParse(
                              log.startTime ?? '',
                            );
                            final end = DateTime.tryParse(log.endTime ?? '');
                            final duration = end != null
                                ? end.difference(start!)
                                : DateTime.now().difference(start!);
                            final durationStr =
                                '${duration.inHours}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s';
                            final isSynced = log.syncStatus == 1;

                            // Resolve Test Set Name
                            final testSetName = log.jobTestSetRecId != null
                                ? testSetMap[log.jobTestSetRecId]
                                : null;

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: isWork
                                      ? Colors.green.shade100
                                      : Colors.orange.shade100,
                                  child: Icon(
                                    isWork ? Icons.work : Icons.coffee,
                                    color: isWork
                                        ? Colors.green
                                        : Colors.orange,
                                    size: 20,
                                  ),
                                ),
                                title: Text(
                                  log.activityName ??
                                      log.activityId ??
                                      'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    if (testSetName != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        margin: const EdgeInsets.only(
                                          bottom: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          'Test Set: $testSetName',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    Text(
                                      'Start: ${DateFormat('HH:mm:ss').format(start)}',
                                    ),
                                    if (end != null)
                                      Text(
                                        'End: ${DateFormat('HH:mm:ss').format(end)}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      durationStr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (end == null)
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              right: 8.0,
                                            ),
                                            child: Text(
                                              'Running...',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        Icon(
                                          isSynced
                                              ? Icons.cloud_done_outlined
                                              : Icons.cloud_off,
                                          size: 16,
                                          color: isSynced
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ); // End Logs StreamBuilder
      },
    ); // End TestSet StreamBuilder
  }

  Widget _buildBigButton(
    String text,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // --- Tab 2: Test Sets (Updated with Manual Input) ---
  Widget _buildTestSetsTab(AppDatabase db) {
    return Column(
      children: [
        // แถวปุ่มควบคุม
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // ปุ่ม Scan QR
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleScanTestSet,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan QR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ปุ่ม Manual Input (ใหม่! ⭐)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleManualInputTestSet,
                  icon: const Icon(Icons.keyboard),
                  label: const Text('Manual Input'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),

        // รายการ Test Sets (เหมือนเดิม)
        Expanded(
          child: StreamBuilder<List<DbJobTestSet>>(
            stream: db.runningJobDetailsDao.watchTestSetsByDocId(
              widget.documentId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              final items = snapshot.data!;

              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No Test Sets added.\nScan QR or enter manually to start.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: const Icon(
                          Icons.science,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        item.setItemNo ?? 'Unknown Code',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Registered by: ${item.registerUser ?? '-'}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          item.syncStatus == 0
                              ? const Icon(
                                  Icons.cloud_upload_outlined,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                          IconButton(
                            onPressed: () => _confirmDeleteTestSet(item),
                            icon: const Icon(Icons.delete, color: Colors.red),
                            tooltip: 'Delete',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Machine Action Dialogs ---

  // --- Tab 3: Machines (Updated) ---
  Widget _buildMachinesTab(AppDatabase db) {
    return Column(
      children: [
        // 1. แถวปุ่มควบคุม (Scan & Manual)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // ปุ่ม Scan QR
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleScanMachine,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan Machine'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // ใช้สีม่วงแยกความแตกต่าง
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ปุ่ม Manual Input
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleManualInputMachine,
                  icon: const Icon(Icons.keyboard),
                  label: const Text('Manual Input'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.purple),
                    foregroundColor: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),

        // 2. รายการ Machines
        Expanded(
          child: StreamBuilder<List<DbRunningJobMachine>>(
            // เรียก watchMachinesByDocId จาก DAO
            stream: db.runningJobDetailsDao.watchMachinesByDocId(
              widget.documentId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              final items = snapshot.data!;

              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No Machines added.\nScan QR or enter manually to start.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade50,
                        child: const Icon(
                          Icons.precision_manufacturing,
                          color: Colors.purple,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        item.machineNo ?? 'Unknown Machine',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Registered by: ${item.registerUser ?? '-'}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _confirmDeleteMachine(item),
                            icon: const Icon(Icons.delete, color: Colors.red),
                            tooltip: 'Delete',
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MachineDetailScreen(
                              machine: item,
                              documentId: widget.documentId,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // -------------------------------------------------------
  // ⚙️ Machine Actions (Scan & Manual)
  // -------------------------------------------------------

  // 1. Helper Function: บันทึก Machine ลง Database
  Future<void> _saveMachine(String code) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addMachineByQrCode(
        documentId: widget.documentId,
        qrCode: code,
        userId: userId,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Machine Added: $code')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // 2. ฟังก์ชัน Scan Machine QR
  Future<void> _handleScanMachine() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      await _saveMachine(result);
    }
  }

  // 3. ฟังก์ชัน Manual Input Machine
  Future<void> _handleManualInputMachine() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Machine (Manual)'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Machine No.',
            hintText: 'Type Machine ID here...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.precision_manufacturing),
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
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      await _saveMachine(result);
    }
  }

  // 4. Delete Confirmations (Soft Delete)
  Future<void> _confirmDeleteTestSet(DbJobTestSet item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Test Set'),
        content: Text('Delete Test Set "${item.setItemNo}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      try {
        await db.runningJobDetailsDao.deleteJobTestSet(item.recId);
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Test Set deleted.')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<void> _confirmDeleteMachine(DbRunningJobMachine item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Machine'),
        content: Text('Delete Machine "${item.machineNo}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      try {
        await db.runningJobDetailsDao.deleteRunningJobMachine(item.recId);
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Machine deleted.')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }
}
