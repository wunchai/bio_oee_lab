import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/activity_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  void _showAddOptions() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('Scan Machine QR'),
              onTap: () {
                Navigator.pop(ctx);
                _scanQr();
              },
            ),
            ListTile(
              leading: const Icon(Icons.keyboard),
              title: const Text('Manual Input'),
              onTap: () {
                Navigator.pop(ctx);
                _manualInput();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanQr() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );
    if (result != null && result.isNotEmpty) {
      _showActivityTypeDialog(result);
    }
  }

  Future<void> _scanQrForSearch() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );
    if (result != null && result.isNotEmpty) {
      setState(() {
        _searchController.text = result;
        _searchQuery = result;
      });
    }
  }

  Future<void> _manualInput() async {
    final controller = TextEditingController();
    final machineNo = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Manual Input'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Machine No / Station'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Next'),
          ),
        ],
      ),
    );

    if (machineNo != null && machineNo.isNotEmpty) {
      _showActivityTypeDialog(machineNo);
    }
  }

  void _showActivityTypeDialog(String machineNo) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Machine: $machineNo'),
        content: const Text('Select Activity Type:'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(ctx);
              _startActivity(machineNo, 'Setup');
            },
            icon: const Icon(Icons.settings),
            label: const Text('SETUP'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(ctx);
              _startActivity(machineNo, 'Clean');
            },
            icon: const Icon(Icons.cleaning_services),
            label: const Text('CLEAN'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startActivity(String machineNo, String type) async {
    try {
      final repo = context.read<ActivityRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.startActivity(
        machineNo: machineNo,
        activityType: type,
        userId: userId,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Started $type on $machineNo')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _endActivity(DbActivityLog activity) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Finish Activity'),
        content: Text(
          'Finish ${activity.activityType} on ${activity.machineNo}?',
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
            child: const Text('Finish'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await context.read<ActivityRepository>().endActivity(activity.recId);
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Activity Completed')));
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

  Future<void> _deleteActivity(DbActivityLog activity) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Activity'),
        content: Text(
          'Are you sure you want to delete ${activity.activityType} on ${activity.machineNo}?',
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
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await context.read<ActivityRepository>().deleteActivity(activity.recId);
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Activity Deleted')));
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

  Future<void> _syncActivities() async {
    try {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Syncing...')));
      }
      await context.read<ActivityRepository>().syncActivityLogs(
        context.read<LoginRepository>().loggedInUser?.userId ?? '',
        context.read<DeviceInfoService>().getLoginDeviceId(),
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Sync Completed')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sync Failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _selectedStatus = 1; // 1=Running, 2=Completed, 3=Deleted

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<ActivityRepository>();
    final loginRepo = context.watch<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    if (userId.isEmpty) return const Center(child: Text('Please Login First'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Machine Activities'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search Machine / Type...',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                color: Colors.black87,
                              ),
                              onPressed: _scanQrForSearch,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      'Status: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: _selectedStatus,
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.black,
                      underline: Container(height: 1, color: Colors.black),
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('Running')),
                        DropdownMenuItem(value: 2, child: Text('Completed')),
                        DropdownMenuItem(value: 3, child: Text('Deleted')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedStatus = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.cloud_upload),
            onPressed: _syncActivities,
          ),
        ],
      ),
      body: StreamBuilder<List<DbActivityLog>>(
        stream: repo.watchMyActivities(
          userId,
          query: _searchQuery,
          status: _selectedStatus,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          final list = snapshot.data!;

          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history_edu, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'No active activities.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _showAddOptions,
                    icon: const Icon(Icons.add),
                    label: const Text('Start New Activity'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: list.length,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 80),
            itemBuilder: (context, index) {
              final item = list[index];
              return ActivityListItem(
                item: item,
                onDelete: () => _deleteActivity(item),
                onFinish: () => _endActivity(item),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'activity_screen_fab',
        onPressed: _showAddOptions,
        icon: const Icon(Icons.add),
        label: const Text('Activity'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ActivityListItem extends StatefulWidget {
  final DbActivityLog item;
  final VoidCallback onDelete;
  final VoidCallback onFinish;

  const ActivityListItem({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onFinish,
  });

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final start = DateTime.tryParse(item.startTime ?? '');
    final duration = start != null
        ? DateTime.now().difference(start)
        : Duration.zero;
    final durationStr = '${duration.inHours}h ${duration.inMinutes % 60}m';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        elevation: _isHovered ? 8 : 3,
        shadowColor: _isHovered ? Colors.black54 : null,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: item.activityType == 'Setup'
                ? Colors.blue.shade100
                : Colors.green.shade100,
            child: Icon(
              item.activityType == 'Setup'
                  ? Icons.settings
                  : Icons.cleaning_services,
              color: item.activityType == 'Setup' ? Colors.blue : Colors.green,
            ),
          ),
          title: Text(
            '${item.activityType} : ${item.machineNo}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Started: ${start != null ? DateFormat('dd/MM/yyyy HH:mm').format(start) : '-'} ($durationStr)',
              ),
              if (item.syncStatus == 0)
                const Text(
                  '• Waiting Sync',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.grey),
                onPressed: widget.onDelete,
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: widget.onFinish,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                ),
                child: const Text('FINISH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
