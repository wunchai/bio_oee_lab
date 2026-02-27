import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/machine_detail_screen.dart';

class MachineDashboardScreen extends StatefulWidget {
  const MachineDashboardScreen({super.key});

  @override
  State<MachineDashboardScreen> createState() => _MachineDashboardScreenState();
}

class _MachineDashboardScreenState extends State<MachineDashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showEndedMachines = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Helper Function: Save Machine to Database
  Future<void> _saveMachine(String code) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addMachineByQrCode(
        documentId: '',
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
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.orange),
                SizedBox(width: 8),
                Text('Cannot Add Machine'),
              ],
            ),
            content: Text(e.toString().replaceAll('Exception: ', '')),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _handleScanMachine() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      await _saveMachine(result);
    }
  }

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

  Future<void> _confirmDeleteMachine(DbRunningJobMachine item) async {
    final confirm1 = await showDialog<bool>(
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

    if (confirm1 != true) return;

    final db = Provider.of<AppDatabase>(context, listen: false);

    // Check for existing events or items
    final events = await db.runningJobDetailsDao
        .watchMachineLogs(item.recId)
        .first;
    final items = await db.runningJobDetailsDao
        .watchMachineItems(item.recId)
        .first;

    final activeEvents = events.where((e) => e.status != 9).toList();
    final activeItems = items.where((i) => i.status != 9).toList();

    // 1. Block Deletion if "Event End" exists
    final hasEventEnd = activeEvents.any((e) => e.eventType == 'Event End');
    if (hasEventEnd) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Cannot delete this Machine. Event End has already been recorded.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 2. Double Confirmation if other Data Exists
    if (activeEvents.isNotEmpty || activeItems.isNotEmpty) {
      if (!mounted) return;

      final confirm2 = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Warning: Data Exists',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            'This machine already has ${activeEvents.length} events and ${activeItems.length} test sets recorded.\n\nAre you absolutely sure you want to delete it?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Confirm Delete'),
            ),
          ],
        ),
      );

      if (confirm2 != true) return;
    }

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

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Machine Job Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Refresh',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Active Machine...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.purple,
                    ),
                    onPressed: () async {
                      final result = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScannerScreen(),
                        ),
                      );
                      if (result != null && result.isNotEmpty) {
                        setState(() {
                          _searchController.text = result;
                          _searchQuery = result;
                        });
                      }
                    },
                    tooltip: 'Scan Machine QR to Search',
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
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. Controls Row (Scan & Manual)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _handleScanMachine,
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Machine'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
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

          // Filter Checkbox
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Show Ended (Status 1)',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Checkbox(
                  value: _showEndedMachines,
                  activeColor: Colors.purple,
                  onChanged: (val) {
                    setState(() {
                      _showEndedMachines = val ?? false;
                    });
                  },
                ),
              ],
            ),
          ),

          // 2. Active Machines List
          Expanded(
            child: StreamBuilder<List<MachineWithDetails>>(
              stream: db.runningJobDetailsDao
                  .watchAllActiveMachinesWithDetails(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return const Center(child: CircularProgressIndicator());

                var items = snapshot.data!;

                // Filter by ended status
                if (!_showEndedMachines) {
                  items = items
                      .where((m) => m.runningMachine.status == 0)
                      .toList();
                }

                // Filter by search query
                if (_searchQuery.isNotEmpty) {
                  items = items
                      .where(
                        (MachineWithDetails m) =>
                            (m.runningMachine.machineNo ?? '')
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase()) ||
                            (m.masterMachine?.machineName ?? '')
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase()),
                      )
                      .toList();
                }

                if (items.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Active Machines.\nScan QR or enter manually to start.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final runningMachine = item.runningMachine;
                    final masterMachine = item.masterMachine;

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
                          runningMachine.machineNo ?? 'Unknown Machine',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (masterMachine != null) ...[
                              if (masterMachine.machineNo != null &&
                                  masterMachine.machineNo!.isNotEmpty)
                                Text(
                                  'Machine No: ${masterMachine.machineNo}',
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              if (masterMachine.machineName != null &&
                                  masterMachine.machineName!.isNotEmpty)
                                Text(
                                  'Name: ${masterMachine.machineName}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                            ],
                            const SizedBox(height: 4),
                            Text(
                              'Registered by: ${runningMachine.registerUser ?? '-'}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 6),
                            _MachineStatusInfo(
                              machineRecId: runningMachine.recId,
                              db: db,
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  _confirmDeleteMachine(runningMachine),
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'Delete',
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                        onTap: () {
                          // Navigate to MachineDetailScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MachineDetailScreen(
                                machine: runningMachine,
                                documentId: runningMachine.documentId ?? '',
                                masterMachineName: masterMachine?.machineName,
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
      ),
    );
  }
}

class _MachineStatusInfo extends StatelessWidget {
  final String machineRecId;
  final AppDatabase db;

  const _MachineStatusInfo({required this.machineRecId, required this.db});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Test Sets Count
          Icon(Icons.science, size: 14, color: Colors.blue.shade700),
          const SizedBox(width: 4),
          StreamBuilder<List<DbJobMachineItem>>(
            stream: db.runningJobDetailsDao.watchMachineItems(machineRecId),
            builder: (context, snapshot) {
              final count = snapshot.hasData
                  ? snapshot.data!.where((item) => item.status != 9).length
                  : 0;
              return Text(
                '$count Items',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade700,
                ),
              );
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('|', style: TextStyle(color: Colors.grey)),
          ),

          // 2. Latest Event
          Icon(Icons.event_note, size: 14, color: Colors.orange.shade700),
          const SizedBox(width: 4),
          StreamBuilder<List<DbJobMachineEventLog>>(
            stream: db.runningJobDetailsDao.watchMachineLogs(machineRecId),
            builder: (context, snapshot) {
              final activeLogs = snapshot.hasData
                  ? snapshot.data!.where((log) => log.status != 9).toList()
                  : [];

              if (activeLogs.isEmpty) {
                return Text(
                  'draft',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange.shade700,
                  ),
                );
              }

              final latestLog = activeLogs.first;
              final time = DateTime.tryParse(latestLog.startTime ?? '');
              final timeStr = time != null
                  ? DateFormat('HH:mm').format(time)
                  : '';

              return Text(
                '${latestLog.eventType} $timeStr'.trim(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange.shade700,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
