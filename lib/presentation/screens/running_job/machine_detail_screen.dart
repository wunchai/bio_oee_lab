import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/repositories/activity_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';

class MachineDetailScreen extends StatefulWidget {
  final DbRunningJobMachine machine;
  final String documentId;
  final String? masterMachineName;

  const MachineDetailScreen({
    super.key,
    required this.machine,
    required this.documentId,
    this.masterMachineName,
  });

  @override
  State<MachineDetailScreen> createState() => _MachineDetailScreenState();
}

class _MachineDetailScreenState extends State<MachineDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showFloatingSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : null,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
      ),
    );
  }

  // --- Actions ---

  Future<void> _showMachineActionDialog() async {
    final titleText =
        widget.masterMachineName != null && widget.masterMachineName!.isNotEmpty
        ? '${widget.machine.machineNo} - ${widget.masterMachineName}'
        : '${widget.machine.machineNo}';

    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(titleText)),
            IconButton(
              icon: const Icon(Icons.close),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(ctx),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select an event to record:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Start'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Start', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Breakdown'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Breakdown', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Event End'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Event End', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );

    if (result != null) {
      try {
        final repo = context.read<DocumentRepository>();
        final loginRepo = context.read<LoginRepository>();
        final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';
        final db = Provider.of<AppDatabase>(context, listen: false);

        if (result == 'Event End') {
          // Check if there is already a 'Start' event
          final logs = await db.runningJobDetailsDao
              .watchMachineLogs(widget.machine.recId)
              .first;
          final hasStart = logs
              .where((l) => l.status != 9)
              .any((l) => l.eventType == 'Start');

          if (!hasStart) {
            // Show dialog to input Start and Clean times
            final times = await _showMissingStartDialog();
            if (times == null) {
              return; // User cancelled
            }

            final startDateTimeStr = times['startDateTime']!;
            final cleanDateTimeStr = times['cleanDateTime']!;

            // 1. Add Start Event at chosen start time
            await repo.addMachineEventWithTime(
              machineRecId: widget.machine.recId,
              activityType: 'Start',
              userId: userId,
              startTime: startDateTimeStr,
            );

            // 2. Add Event End (current time handles normally in repo, but we might want them consecutive)
            // Using standard repo method (will use DateTime.now() if not modified, or we can pass cleanDateTimeStr)
            await repo.addMachineEvent(
              machineRecId: widget.machine.recId,
              activityType: 'Event End',
              userId: userId,
            );

            // 3. Add Clean Event in DbActivityLog
            final activityRepo = context.read<ActivityRepository>();
            await activityRepo.startActivityWithTime(
              machineNo: widget.machine.machineNo ?? '',
              activityType: 'Clean',
              userId: userId,
              startTime: startDateTimeStr,
              endTime: cleanDateTimeStr,
              remark: 'Auto-generated from Event End',
            );

            if (mounted) {
              _showFloatingSnackBar(
                'Auto-recorded Start, Event End, and Clean for ${widget.machine.machineNo}',
              );
            }
            return;
          }
        }

        // Normal flow for other events or if Start already exists
        await repo.addMachineEvent(
          machineRecId: widget.machine.recId,
          activityType: result,
          userId: userId,
        );

        if (mounted) {
          _showFloatingSnackBar(
            'Recorded $result for ${widget.machine.machineNo}',
          );
        }
      } catch (e) {
        if (mounted) {
          _showFloatingSnackBar('Error: $e', isError: true);
        }
      }
    }
  }

  Future<Map<String, String>?> _showMissingStartDialog() async {
    DateTime selectedStartDate = DateTime.now();
    TimeOfDay selectedStartTime = TimeOfDay.now();

    DateTime selectedCleanDate = DateTime.now();
    TimeOfDay selectedCleanTime = TimeOfDay.now();

    return await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future<void> pickStartDateTime() async {
              final date = await showDatePicker(
                context: context,
                initialDate: selectedStartDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date == null) return;
              if (!mounted) return;
              final time = await showTimePicker(
                context: context,
                initialTime: selectedStartTime,
              );
              if (time == null) return;

              setState(() {
                selectedStartDate = date;
                selectedStartTime = time;
              });
            }

            Future<void> pickCleanDateTime() async {
              final date = await showDatePicker(
                context: context,
                initialDate: selectedCleanDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date == null) return;
              if (!mounted) return;
              final time = await showTimePicker(
                context: context,
                initialTime: selectedCleanTime,
              );
              if (time == null) return;

              setState(() {
                selectedCleanDate = date;
                selectedCleanTime = time;
              });
            }

            final startStr =
                DateFormat('yyyy-MM-dd').format(selectedStartDate) +
                ' ' +
                selectedStartTime.format(context);
            final cleanStr =
                DateFormat('yyyy-MM-dd').format(selectedCleanDate) +
                ' ' +
                selectedCleanTime.format(context);

            return AlertDialog(
              title: const Text(
                'Missing Start Event',
                style: TextStyle(color: Colors.orange),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This machine has no "Start" event. Please provide the Start and Clean times.',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Start Time:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(startStr),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: pickStartDateTime,
                    ),
                    const Divider(),
                    const Text(
                      'Clean Finish Time:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(cleanStr),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: pickCleanDateTime,
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
                  onPressed: () {
                    final startDateTime = DateTime(
                      selectedStartDate.year,
                      selectedStartDate.month,
                      selectedStartDate.day,
                      selectedStartTime.hour,
                      selectedStartTime.minute,
                    );
                    final cleanDateTime = DateTime(
                      selectedCleanDate.year,
                      selectedCleanDate.month,
                      selectedCleanDate.day,
                      selectedCleanTime.hour,
                      selectedCleanTime.minute,
                    );

                    Navigator.pop(ctx, {
                      'startDateTime': startDateTime.toIso8601String(),
                      'cleanDateTime': cleanDateTime.toIso8601String(),
                    });
                  },
                  child: const Text('Save Events'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // --- Add Test Set to Machine ---

  void _showAddTestSetOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('Scan QR Code'),
              onTap: () {
                Navigator.pop(context);
                _scanAndAddTestSet();
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Select from Running Test Sets'),
              onTap: () {
                Navigator.pop(context);
                _selectTestSetFromList();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanAndAddTestSet() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      // Find Test Set by QR Code (setItemNo)
      final matchingTestSets =
          await (db.select(db.jobTestSets)..where(
                (t) => t.setItemNo.equals(result) & t.status.isNotValue(9),
              ))
              .get();

      if (matchingTestSets.isNotEmpty) {
        // Just take the first active one we find
        await _addSelectedTestSet(matchingTestSets.first);
      } else {
        if (mounted) {
          _showFloatingSnackBar(
            'Test Set not found for QR: $result',
            isError: true,
          );
        }
      }
    }
  }

  Future<void> _selectTestSetFromList() async {
    final db = Provider.of<AppDatabase>(context, listen: false);

    // Fetch ALL active Test Sets + their Document details
    final testSetsWithDocs = await db.runningJobDetailsDao
        .watchAllActiveTestSetsWithDocs()
        .first;

    if (!mounted) return;

    if (testSetsWithDocs.isEmpty) {
      _showFloatingSnackBar('No Active Test Sets available.');
      return;
    }

    DbJobTestSet? selectedTestSet;

    final result = await showDialog<DbJobTestSet>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Test Set to ${widget.machine.machineNo}'),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: testSetsWithDocs.length,
                  itemBuilder: (context, index) {
                    final item = testSetsWithDocs[index];
                    final ts = item.testSet;
                    final doc = item.document;

                    final isSelected = selectedTestSet?.recId == ts.recId;

                    return _HoverableCard(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          setState(() {
                            selectedTestSet = ts;
                          });
                          Navigator.pop(ctx, selectedTestSet);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 2)
                                : Border.all(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                            color: isSelected
                                ? Colors.blue.withValues(alpha: 0.05)
                                : null,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue.withValues(
                                      alpha: 0.1,
                                    ),
                                    radius: 18,
                                    child: const Icon(
                                      Icons.science,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ts.setItemNo ?? 'Unknown Set',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          ts.testItemName ?? '-',
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.add_circle,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Divider(
                                  height: 1,
                                  color: Colors.black12,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.inventory_2,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Sample: ${doc?.sampleNo ?? '-'} / ${doc?.sampleName ?? '-'}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.qr_code_2,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'LOT: ${doc?.lotNo ?? '-'}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      await _addSelectedTestSet(result);
    }
  }

  Future<void> _addSelectedTestSet(DbJobTestSet testSet) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addMachineItem(
        documentId: testSet.documentId ?? widget.documentId,
        machineRecId: widget.machine.recId,
        testSetRecId: testSet.recId,
        userId: userId,
      );

      if (mounted) {
        _showFloatingSnackBar(
          'Added Test Set ${testSet.setItemNo} to ${widget.machine.machineNo}',
        );
      }
    } catch (e) {
      if (mounted) {
        _showFloatingSnackBar('Error: $e', isError: true);
      }
    }
  }

  Future<void> _deleteEvent(String recId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Event'),
        content: const Text('Are you sure you want to delete this event?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await context.read<DocumentRepository>().deleteMachineEvent(recId);
        if (mounted) {
          _showFloatingSnackBar('Event deleted');
        }
      } catch (e) {
        if (mounted) {
          _showFloatingSnackBar('Error: $e', isError: true);
        }
      }
    }
  }

  Future<void> _deleteItem(String recId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Are you sure you want to remove this test set?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await context.read<DocumentRepository>().deleteMachineItem(recId);
        if (mounted) {
          _showFloatingSnackBar('Item removed');
        }
      } catch (e) {
        if (mounted) {
          _showFloatingSnackBar('Error: $e', isError: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    final titleText =
        widget.masterMachineName != null && widget.masterMachineName!.isNotEmpty
        ? '${widget.machine.machineNo} - ${widget.masterMachineName}'
        : widget.machine.machineNo ?? 'Machine Detail';

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.event_note), text: 'Events'),
            Tab(icon: Icon(Icons.science), text: 'Test Sets'),
          ],
        ),
      ),
      body: StreamBuilder<List<DbJobMachineEventLog>>(
        stream: db.runningJobDetailsDao.watchMachineLogs(widget.machine.recId),
        builder: (context, snapshot) {
          bool isEnded = false;
          if (snapshot.hasData) {
            isEnded = snapshot.data!
                .where((l) => l.status != 9)
                .any((l) => l.eventType == 'Event End');
          }

          return Column(
            children: [
              if (isEnded)
                Container(
                  width: double.infinity,
                  color: Colors.red.shade100,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    'This machine session has ended. Data is read-only.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildEventsTab(db, isEnded),
                    _buildItemsTab(db, isEnded),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEventsTab(AppDatabase db, bool isEnded) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<DbJobMachineEventLog>>(
            stream: db.runningJobDetailsDao.watchMachineLogs(
              widget.machine.recId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final logs = snapshot.data!
                  .where((l) => l.status != 9)
                  .toList(); // Filter deleted

              if (logs.isEmpty) {
                return const Center(child: Text('No events recorded.'));
              }

              return ListView.builder(
                itemCount: logs.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final log = logs[index];
                  final time = DateTime.tryParse(log.startTime ?? '');
                  final timeStr = time != null
                      ? DateFormat('HH:mm:ss').format(time)
                      : '-';
                  final isStart = log.eventType == 'Start';

                  return _HoverableCard(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isStart
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.red.withValues(alpha: 0.1),
                        child: Icon(
                          isStart ? Icons.play_arrow : Icons.warning,
                          color: isStart ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(
                        log.eventType ?? 'Event',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Time: $timeStr'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Sync Status Icon
                          Icon(
                            log.syncStatus == 1
                                ? Icons.cloud_done_outlined
                                : Icons.cloud_off,
                            color: log.syncStatus == 1
                                ? Colors.green
                                : Colors.grey,
                            size: 20,
                          ),
                          if (!isEnded) ...[
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => _deleteEvent(log.recId),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (!isEnded)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _showMachineActionDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Event'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildItemsTab(AppDatabase db, bool isEnded) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<DbJobMachineItem>>(
            stream: db.runningJobDetailsDao.watchMachineItems(
              widget.machine.recId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final items = snapshot.data!
                  .where((i) => i.status != 9)
                  .toList(); // Filter deleted

              if (items.isEmpty) {
                return const Center(child: Text('No items added.'));
              }

              return ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final mItem = items[index];
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: () async {
                      final ts =
                          await (db.select(db.jobTestSets)..where(
                                (t) => t.recId.equals(mItem.jobTestSetRecId!),
                              ))
                              .getSingleOrNull();
                      if (ts == null) return null;
                      final doc = ts.documentId != null
                          ? await (db.select(db.documents)..where(
                                  (d) => d.documentId.equals(ts.documentId!),
                                ))
                                .getSingleOrNull()
                          : null;
                      return {'ts': ts, 'doc': doc};
                    }(),
                    builder: (context, snapshot) {
                      final ts = snapshot.data?['ts'] as DbJobTestSet?;
                      final doc = snapshot.data?['doc'] as DbDocument?;
                      final tsName = ts?.setItemNo ?? 'Unknown';
                      final testItemName = ts?.testItemName ?? '-';
                      final time = DateTime.tryParse(
                        mItem.registerDateTime ?? '',
                      );
                      final timeStr = time != null
                          ? DateFormat('HH:mm').format(time)
                          : '-';

                      return _HoverableCard(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.withValues(alpha: 0.1),
                            child: const Icon(
                              Icons.science,
                              color: Colors.blue,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tsName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                testItemName,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.inventory_2,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'Sample: ${doc?.sampleNo ?? '-'} / ${doc?.sampleName ?? '-'}',
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.qr_code_2,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'LOT: ${doc?.lotNo ?? '-'}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Added: $timeStr',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                mItem.syncStatus == 1
                                    ? Icons.cloud_done_outlined
                                    : Icons.cloud_off,
                                color: mItem.syncStatus == 1
                                    ? Colors.green
                                    : Colors.grey,
                                size: 20,
                              ),
                              if (!isEnded) ...[
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _deleteItem(mItem.recId),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        if (!isEnded)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _showAddTestSetOptions,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Test Set'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _HoverableCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;

  const _HoverableCard({required this.child, this.margin});

  @override
  State<_HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<_HoverableCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(
            12,
          ), // Match Card default or custom
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.2 : 0.1),
              blurRadius: _isHovered ? 12 : 4,
              offset: Offset(0, _isHovered ? 6 : 2),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
