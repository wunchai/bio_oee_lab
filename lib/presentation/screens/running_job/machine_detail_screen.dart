import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';

class MachineDetailScreen extends StatefulWidget {
  final DbRunningJobMachine machine;
  final String documentId;

  const MachineDetailScreen({
    super.key,
    required this.machine,
    required this.documentId,
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

  // --- Actions ---

  Future<void> _showMachineActionDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Machine: ${widget.machine.machineNo}'),
        content: const Text('Select an event to record:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, 'Start'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Start'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, 'Breakdown'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Breakdown'),
          ),
        ],
      ),
    );

    if (result != null) {
      try {
        final repo = context.read<DocumentRepository>();
        final loginRepo = context.read<LoginRepository>();
        final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

        await repo.addMachineEvent(
          machineRecId: widget.machine.recId,
          activityType: result,
          userId: userId,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Recorded $result for ${widget.machine.machineNo}'),
            ),
          );
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

  Future<void> _showMachineItemDialog() async {
    final db = Provider.of<AppDatabase>(context, listen: false);

    // Fetch available Test Sets for this Document
    final testSets = await db.runningJobDetailsDao
        .watchTestSetsByDocId(widget.documentId)
        .first;

    if (!mounted) return;

    if (testSets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Test Sets available. Add one first.')),
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
              title: Text('Add Test Set to ${widget.machine.machineNo}'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      try {
        final repo = context.read<DocumentRepository>();
        final loginRepo = context.read<LoginRepository>();
        final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

        await repo.addMachineItem(
          documentId: widget.documentId,
          machineRecId: widget.machine.recId,
          testSetRecId: result.recId,
          userId: userId,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added Test Set ${result.setItemNo} to ${widget.machine.machineNo}',
              ),
            ),
          );
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Event deleted')));
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Item removed')));
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

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machine.machineNo ?? 'Machine Detail'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.event_note), text: 'Events'),
            Tab(icon: Icon(Icons.science), text: 'Test Sets'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildEventsTab(db), _buildItemsTab(db)],
      ),
    );
  }

  Widget _buildEventsTab(AppDatabase db) {
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
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => _deleteEvent(log.recId),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
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
      ],
    );
  }

  Widget _buildItemsTab(AppDatabase db) {
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
                  return FutureBuilder<DbJobTestSet?>(
                    future:
                        (db.select(db.jobTestSets)..where(
                              (t) => t.recId.equals(mItem.jobTestSetRecId!),
                            ))
                            .getSingleOrNull(),
                    builder: (context, tsSnapshot) {
                      final tsName = tsSnapshot.data?.setItemNo ?? 'Unknown';
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
                          title: Text(
                            tsName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Added: $timeStr'),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _deleteItem(mItem.recId),
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showMachineItemDialog,
              icon: const Icon(Icons.add),
              label: const Text('Add Test Set'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
