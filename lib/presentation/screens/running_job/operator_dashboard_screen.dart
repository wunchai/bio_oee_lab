import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';

import 'package:bio_oee_lab/presentation/screens/running_job/running_job_detail_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/activity_summary_screen.dart'; // New Import // For Switch Activity logic if needed, or duplicate

class OperatorDashboardScreen extends StatefulWidget {
  const OperatorDashboardScreen({super.key});

  @override
  State<OperatorDashboardScreen> createState() =>
      _OperatorDashboardScreenState();
}

class _OperatorDashboardScreenState extends State<OperatorDashboardScreen> {
  // Reuse logic from Detail Screen for Switching Activity?
  // Ideally, we replicate the simple "Start/Pause" and "Switch" dialog here.

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
        title: const Text('Operator Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<DbDocument>>(
        // Watch ALL active documents (Status 1=Running, but we might want to see Draft(0) too if they want to start it?)
        // Let's assume user only controls "Running" jobs (Status 1) or maybe all active (0,1).
        // For simplicity, let's show status 0 and 1.
        stream: documentRepo.watchActiveDocuments(
          userId,
          statusFilter: [0, 1], // Draft & Running
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
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dashboard_customize, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No active jobs found.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return _DashboardJobCard(doc: doc);
            },
          );
        },
      ),
    );
  }
}

class _DashboardJobCard extends StatefulWidget {
  final DbDocument doc;

  const _DashboardJobCard({required this.doc});

  @override
  State<_DashboardJobCard> createState() => _DashboardJobCardState();
}

class _DashboardJobCardState extends State<_DashboardJobCard> {
  DbJobTestSet? _selectedTestSet;

  @override
  void initState() {
    super.initState();
    _loadLastUsedTestSet();
  }

  Future<void> _loadLastUsedTestSet() async {
    if (widget.doc.documentId == null) return;
    try {
      final db = Provider.of<AppDatabase>(context, listen: false);
      final lastTestSetId = await db.runningJobDetailsDao
          .getLastUsedJobTestSetId(widget.doc.documentId!);

      if (lastTestSetId != null && mounted) {
        // Find the full object
        final testSets = await db.runningJobDetailsDao
            .watchTestSetsByDocId(widget.doc.documentId!)
            .first;
        final match = testSets
            .where((t) => t.recId == lastTestSetId)
            .firstOrNull;
        if (match != null && mounted) {
          setState(() {
            _selectedTestSet = match;
          });
        }
      }
    } catch (_) {
      // Ignore errors for auto-load
    }
  }

  Future<void> _handleStartResume(
    String activityType, [
    String? activityName,
  ]) async {
    // Enforcement: Must have Test Set selected
    if (_selectedTestSet == null) {
      if (mounted) {
        final selected = await _showTestSetSelectionDialog();
        if (selected != null) {
          setState(() {
            _selectedTestSet = selected;
          });
          // Proceed with the action
        } else {
          // User cancelled selection, abort action
          return;
        }
      } else {
        return;
      }
    }

    try {
      final repo = context.read<DocumentRepository>();
      final userId = context.read<LoginRepository>().loggedInUser?.userId ?? '';

      // If document is Draft(0), move to Running(1)
      await repo.handleUserAction(
        documentId: widget.doc.documentId!,
        userId: userId,
        activityType: activityType,
        activityName: activityName,
        newDocStatus: 1, // Always Running
        jobTestSetId: _selectedTestSet?.recId, // Use selected Test Set
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _handlePause() async {
    try {
      final repo = context.read<DocumentRepository>();
      final userId = context.read<LoginRepository>().loggedInUser?.userId ?? '';

      await repo.handleUserAction(
        documentId: widget.doc.documentId!,
        userId: userId,
        activityType: 'PAUSE_DASHBOARD',
        activityName: 'Paused (Dashboard)', // Or 'Break'
        newDocStatus: 1,
        jobTestSetId: null,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _handleSwitchActivity() async {
    // Enforcement: Must have Test Set selected
    if (_selectedTestSet == null) {
      final selected = await _showTestSetSelectionDialog();
      if (selected != null) {
        setState(() {
          _selectedTestSet = selected;
        });
      } else {
        return; // Cancelled
      }
    }

    if (!mounted) return;

    // Seed defaults first (parity with Detail Screen)
    final db = Provider.of<AppDatabase>(context, listen: false);
    final loginRepo = Provider.of<LoginRepository>(context, listen: false);
    final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

    await db.humanActivityTypeDao.seedDefaultActivities(
      widget.doc.documentId!,
      userId,
    );

    if (!mounted) return;

    // Fetch activities filtered by Test Set
    final acts = await db.humanActivityTypeDao.getActiveActivities(
      widget.doc.documentId!,
      testSetRecId: _selectedTestSet?.recId,
    );

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Switch Activity'),
        // Simplified Dialog (No Create New)
        content: SizedBox(
          width: double.maxFinite,
          child: acts.isEmpty
              ? const Center(
                  child: Text('No activities found for this Test Set'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: acts.length,
                  itemBuilder: (context, index) {
                    final act = acts[index];
                    return ListTile(
                      title: Text(
                        act.activityName ?? act.activityCode ?? 'Unknown',
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        if (act.activityCode != null) {
                          _handleStartResume(
                            act.activityCode!,
                            act.activityName,
                          ); // Start new activity
                        }
                      },
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
      ),
    );
  }

  Future<DbJobTestSet?> _showTestSetSelectionDialog() async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    return showDialog<DbJobTestSet>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Select Test Set'),
        content: SizedBox(
          width: double.maxFinite,
          child: StreamBuilder<List<DbJobTestSet>>(
            stream: db.runningJobDetailsDao.watchTestSetsByDocId(
              widget.doc.documentId!,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final items = snapshot.data!;
              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No Test Sets found for this job.',
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: const Icon(Icons.science, color: Colors.blue),
                    title: Text(item.setItemNo ?? 'Unknown'),
                    onTap: () => Navigator.pop(ctx, item),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, null), // Select None
            child: const Text('Clear Selection'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doc.documentId == null) return const SizedBox.shrink();

    final db = Provider.of<AppDatabase>(context);

    // Listen to the stats for THIS document
    return StreamBuilder<List<DbJobWorkingTime>>(
      stream: db.runningJobDetailsDao.watchUserLogs(widget.doc.documentId!),
      builder: (context, snapshot) {
        final logs = snapshot.data ?? [];

        // Find current status
        final currentLog = logs.isEmpty
            ? null
            : logs.firstWhere(
                (l) => l.endTime == null,
                orElse: () => logs.first,
              );

        final bool hasOpenLog =
            currentLog != null && currentLog.endTime == null;
        final bool isPaused =
            hasOpenLog &&
            (currentLog.activityId?.startsWith('PAUSE_') ?? false);
        final bool isWorking = hasOpenLog && !isPaused;

        Color statusColor = Colors.grey;
        String statusText = 'Ready';
        IconData statusIcon = Icons.play_arrow;

        if (isWorking) {
          statusColor = Colors.green;
          statusText = 'RUNNING';
          statusIcon = Icons.pause;
        } else if (isPaused) {
          statusColor = Colors.orange;
          statusText = 'PAUSED';
          statusIcon = Icons.play_arrow;
        }

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header: Job Name and Status Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.doc.documentName ?? 'Untitled Job',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Activity: ${currentLog?.activityName ?? "-"}',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                    // Summary Button
                    IconButton(
                      icon: const Icon(Icons.list_alt, color: Colors.blue),
                      tooltip: 'Activity Summary',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivitySummaryScreen(
                              documentId: widget.doc.documentId!,
                              documentName: widget.doc.documentName ?? '-',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: statusColor),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Controls Row
                Row(
                  children: [
                    // Big Play/Pause Button
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (isWorking) {
                            _handlePause();
                          } else {
                            final db = Provider.of<AppDatabase>(
                              context,
                              listen: false,
                            );
                            final loginRepo = Provider.of<LoginRepository>(
                              context,
                              listen: false,
                            );
                            final userId = loginRepo.loggedInUser?.userId ?? '';
                            final lastLog = await db.runningJobDetailsDao
                                .getLastNonPauseUserLog(
                                  widget.doc.documentId!,
                                  userId,
                                );

                            if (lastLog != null && lastLog.activityId != null) {
                              _handleStartResume(
                                lastLog.activityId!,
                                lastLog.activityName,
                              );
                            } else {
                              _handleSwitchActivity();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: isWorking
                              ? Colors.orange
                              : Colors.green,
                          padding: EdgeInsets.zero,
                        ),
                        child: Icon(statusIcon, color: Colors.white, size: 32),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Secondary Actions
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: _handleSwitchActivity,
                              icon: const Icon(Icons.swap_horiz, size: 18),
                              label: const Text('Switch Activity'),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.blue.shade50,
                                side: const BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Test Set Selection
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () async {
                                final selected =
                                    await _showTestSetSelectionDialog();
                                setState(() {
                                  _selectedTestSet = selected;
                                });
                              },
                              icon: const Icon(Icons.science, size: 18),
                              label: Text(
                                _selectedTestSet?.setItemNo ??
                                    'Select Test Set',
                                overflow: TextOverflow.ellipsis,
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.cyan.shade50,
                                side: const BorderSide(color: Colors.cyan),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Optional: "Open Detail" button
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RunningJobDetailScreen(
                                          documentId: widget.doc.documentId!,
                                        ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.open_in_new, size: 18),
                              label: const Text('Open Details'),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.grey.shade50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                // Machines Section (Horizontal Scroll)
                SizedBox(
                  width: double.infinity,
                  child: StreamBuilder<List<DbRunningJobMachine>>(
                    stream: db.runningJobDetailsDao.watchMachinesByDocId(
                      widget.doc.documentId!,
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || (snapshot.data!.isEmpty)) {
                        return const SizedBox.shrink();
                      }
                      final machines = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Machines:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: machines
                                  .map(
                                    (m) => Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: _MachineControlChip(machine: m),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MachineControlChip extends StatelessWidget {
  final DbRunningJobMachine machine;

  const _MachineControlChip({required this.machine});

  Future<void> _showAssignTestSetDialog(BuildContext context) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final repo = context.read<DocumentRepository>();
    final loginRepo = context.read<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

    // 1. Fetch Test Sets
    final testSets = await db.runningJobDetailsDao
        .watchTestSetsByDocId(machine.documentId!)
        .first;

    if (!context.mounted) return;

    if (testSets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Test Sets available for this job.')),
      );
      return;
    }

    DbJobTestSet? selectedTestSet;

    final result = await showDialog<DbJobTestSet>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Assign Test Set to ${machine.machineNo}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('A Test Set is required before starting.'),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<DbJobTestSet>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Select Test Set',
                      border: OutlineInputBorder(),
                    ),
                    items: testSets.map((ts) {
                      return DropdownMenuItem(
                        value: ts,
                        child: Text(ts.setItemNo ?? 'Unknown'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedTestSet = val;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: selectedTestSet == null
                      ? null
                      : () => Navigator.pop(ctx, selectedTestSet),
                  child: const Text('Assign & Continue'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      try {
        await repo.addMachineItem(
          documentId: machine.documentId!,
          machineRecId: machine.recId,
          testSetRecId: result.recId,
          userId: userId,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Assigned ${result.setItemNo} to ${machine.machineNo}',
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      }
    }
  }

  Future<void> _handleMachineAction(
    BuildContext context,
    bool isRunning,
  ) async {
    // 🔴 Validation: Before Starting, check for Test Set
    if (!isRunning) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      final items = await db.runningJobDetailsDao
          .watchMachineItems(machine.recId)
          .first;

      if (items.isEmpty) {
        if (!context.mounted) return;
        // Prompt to assign
        await _showAssignTestSetDialog(context);

        // Re-check if assignment was successful
        final checkItems = await db.runningJobDetailsDao
            .watchMachineItems(machine.recId)
            .first;
        if (checkItems.isEmpty) {
          // User cancelled or failed
          return;
        }
      }
    }

    if (!context.mounted) return;

    final action = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(machine.machineNo ?? 'Unknown Machine'),
        content: Text(
          isRunning
              ? 'Stop or record Breakdown for this machine?'
              : 'Start this machine?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          if (!isRunning)
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Start'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Start'),
            ),
          if (isRunning) ...[
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Stop'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text('Stop'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'Breakdown'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Breakdown'),
            ),
          ],
        ],
      ),
    );

    if (action != null && context.mounted) {
      try {
        final repo = context.read<DocumentRepository>();
        final loginRepo = context.read<LoginRepository>();
        final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

        await repo.addMachineEvent(
          machineRecId: machine.recId,
          activityType: action,
          userId: userId,
        );
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return StreamBuilder<List<DbJobMachineEventLog>>(
      stream: db.runningJobDetailsDao.watchMachineLogs(machine.recId),
      builder: (context, snapshot) {
        // watchMachineLogs orders by startTime desc, so first is latest
        final lastLog = (snapshot.data?.isNotEmpty ?? false)
            ? snapshot.data!.first
            : null;

        // State Machine Logic
        // 1. Idle/Stopped: Grey, Can Start
        // 2. Running: Green, Can Stop

        final bool isRunning = lastLog != null && lastLog.endTime == null;

        Color color = isRunning ? Colors.green : Colors.grey;
        IconData icon = isRunning ? Icons.settings_suggest : Icons.play_arrow;

        final label = machine.machineNo ?? '-';

        return ActionChip(
          avatar: Icon(icon, color: Colors.white, size: 16),
          label: Text(label, style: const TextStyle(color: Colors.white)),
          backgroundColor: color,
          onPressed: () => _handleMachineAction(context, isRunning),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }
}
