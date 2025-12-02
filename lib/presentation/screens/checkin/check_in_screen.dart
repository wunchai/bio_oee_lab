import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/check_in_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  @override
  void initState() {
    super.initState();
    // Load Master Data if not exists
    Future.microtask(() => context.read<CheckInRepository>().initData());
  }

  Future<void> _handleScan() async {
    final locationCode = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (locationCode != null && locationCode.isNotEmpty) {
      if (mounted) {
        _showCheckInDialog(locationCode);
      }
    }
  }

  Future<void> _handleManualInput() async {
    final controller = TextEditingController();
    final locationCode = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Manual Check-In'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Location Code',
            hintText: 'Enter location code',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Next'),
          ),
        ],
      ),
    );

    if (locationCode != null && locationCode.isNotEmpty) {
      if (mounted) {
        _showCheckInDialog(locationCode);
      }
    }
  }

  void _showCheckInDialog(String locationCode) async {
    final repo = context.read<CheckInRepository>();
    final activities = await repo.getActivities();

    String selectedActivity = 'None (Default)';
    final remarkController = TextEditingController();

    if (!mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Check-In'),
                Text(
                  'Location: $locationCode',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Activity'),
                  value: selectedActivity,
                  items: activities
                      .map(
                        (act) => DropdownMenuItem(
                          value: act.activityName,
                          child: Text(act.activityName ?? '-'),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => selectedActivity = val);
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: remarkController,
                  decoration: const InputDecoration(
                    labelText: 'Remark (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(ctx);
                  await _processCheckIn(
                    locationCode,
                    selectedActivity,
                    remarkController.text,
                  );
                },
                child: const Text('Confirm Check-In'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _processCheckIn(
    String location,
    String activity,
    String remark,
  ) async {
    try {
      final repo = context.read<CheckInRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.checkIn(
        locationCode: location,
        userId: userId,
        activityName: activity,
        remark: remark,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Checked In at $location ($activity)')),
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

  Future<void> _handleManualCheckOut() async {
    final loginRepo = context.read<LoginRepository>();
    await context.read<CheckInRepository>().checkOut(
      loginRepo.loggedInUser?.userId ?? '',
    );
  }

  Future<void> _syncCheckIns() async {
    try {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Syncing Check-Ins...')));
      }
      await context.read<CheckInRepository>().syncCheckInLogs(
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

  Future<void> _showHistoryDialog() async {
    final repo = context.read<CheckInRepository>();
    final loginRepo = context.read<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    if (userId.isEmpty) return;

    final history = await repo.getCheckInHistory(userId);

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check-In History'),
        content: SizedBox(
          width: double.maxFinite,
          child: history.isEmpty
              ? const Center(child: Text('No history found.'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    final checkIn = item.checkInTime != null
                        ? DateTime.parse(item.checkInTime!)
                        : null;
                    final checkOut = item.checkOutTime != null
                        ? DateTime.parse(item.checkOutTime!)
                        : null;

                    String durationStr = '-';
                    if (checkIn != null && checkOut != null) {
                      final diff = checkOut.difference(checkIn);
                      durationStr = '${diff.inMinutes} mins';
                    }

                    return ListTile(
                      leading: Icon(
                        item.status == 1 ? Icons.location_on : Icons.history,
                        color: item.status == 1 ? Colors.green : Colors.grey,
                      ),
                      title: Text(item.locationCode ?? 'Unknown Location'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Activity: ${item.activityName ?? '-'}'),
                          if (checkIn != null)
                            Text(
                              'In: ${DateFormat('dd/MM HH:mm').format(checkIn)}',
                            ),
                          if (checkOut != null)
                            Text(
                              'Out: ${DateFormat('dd/MM HH:mm').format(checkOut)}',
                            ),
                          Text('Duration: $durationStr'),
                        ],
                      ),
                      trailing: item.syncStatus == 1
                          ? const Icon(Icons.cloud_done, color: Colors.green)
                          : const Icon(Icons.cloud_upload, color: Colors.grey),
                      isThreeLine: true,
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<CheckInRepository>();
    final loginRepo = context.watch<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-In / Out'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _showHistoryDialog,
          ),
          IconButton(
            icon: const Icon(Icons.cloud_upload),
            onPressed: _syncCheckIns,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            StreamBuilder<DbCheckInLog?>(
              stream: repo.watchCurrentStatus(userId),
              builder: (context, snapshot) {
                final current = snapshot.data;
                final isCheckedIn = current != null;

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isCheckedIn
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isCheckedIn
                          ? Colors.green.shade200
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        isCheckedIn ? Icons.location_on : Icons.location_off,
                        size: 64,
                        color: isCheckedIn ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        current != null ? 'CURRENTLY AT' : 'NOT CHECKED IN',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        current != null ? (current.locationCode ?? '-') : '-',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (current != null) ...[
                        const SizedBox(height: 8),
                        Chip(
                          label: Text(current.activityName ?? '-'),
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          'Since: ${DateFormat('HH:mm').format(DateTime.parse(current.checkInTime ?? DateTime.now().toIso8601String()))}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: _handleManualCheckOut,
                          icon: const Icon(Icons.exit_to_app),
                          label: const Text('Check Out Manually'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: _handleScan,
                icon: const Icon(Icons.qr_code_scanner, size: 28),
                label: const Text(
                  'SCAN TO CHECK-IN',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: _handleManualInput,
              icon: const Icon(Icons.keyboard),
              label: const Text('Manual Input (Test)'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Scan new location to automatically\nCheck-Out from previous location.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
