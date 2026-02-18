import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/data/repositories/info_repository.dart';
import 'package:bio_oee_lab/data/database/app_database.dart'; // For DbSyncLog

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Map<String, String> _deviceInfo = {};
  Map<String, int> _unsyncedCounts = {};
  Map<String, String> _lastUpdateTimes = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final repo = context.read<InfoRepository>();
    final deviceInfo = await repo.getDeviceInfo();
    final unsyncedCounts = await repo.getUnsyncedCounts();
    final lastUpdateTimes = await repo.getLastUpdateTimes();

    if (mounted) {
      setState(() {
        _deviceInfo = deviceInfo;
        _unsyncedCounts = unsyncedCounts;
        _lastUpdateTimes = lastUpdateTimes;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadData),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Device Info'),
                  _buildInfoCard(_deviceInfo),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Unsynced Data (Count)'),
                  _buildCountCard(_unsyncedCounts),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Last Updated At'),
                  _buildInfoCard(_lastUpdateTimes),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Sync Actions'),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _handleSyncMaster(context),
                          icon: const Icon(Icons.cloud_download),
                          label: const Text('Sync Master'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade100,
                            foregroundColor: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _handleSyncData(context),
                          icon: const Icon(Icons.cloud_upload),
                          label: const Text('Sync Data'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade100,
                            foregroundColor: Colors.green.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Sync Summary'),
                  _buildSyncHistory(),
                ],
              ),
            ),
    );
  }

  Future<void> _handleSyncMaster(BuildContext context) async {
    final repo = context.read<SyncRepository>();
    final infoRepo = context.read<InfoRepository>();
    final deviceInfo = await infoRepo.getDeviceInfo();
    final userId =
        deviceInfo['deviceSerial'] ?? 'unknown_user'; // Fallback for now

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
              // Auto close on success after a short delay or allow user to close
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
                    : 'Syncing Master Data',
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
                      _loadData(); // Refresh info screen data
                    },
                    child: const Text('Close'),
                  ),
              ],
            );
          },
        );
      },
    );

    await repo.syncMasterData(userId);
    // Note: Dialog auto-closes on success via Future.delayed above, or manual close on error.
    _loadData(); // Refresh info
  }

  Future<void> _handleSyncData(BuildContext context) async {
    final repo = context.read<SyncRepository>();
    final infoRepo = context.read<InfoRepository>();
    final deviceInfo = await infoRepo.getDeviceInfo();
    final userId = deviceInfo['deviceSerial'] ?? 'unknown_user';
    final deviceId = deviceInfo['deviceId'] ?? 'unknown_device';

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
                      _loadData();
                    },
                    child: const Text('Close'),
                  ),
              ],
            );
          },
        );
      },
    );

    await repo.syncTransactionalData(userId, deviceId);
    _loadData(); // Refresh info
  }

  Widget _buildSyncHistory() {
    final repo = context.watch<SyncRepository>();

    return StreamBuilder<List<DbSyncLog>>(
      stream: repo.watchRecentLogs(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('No sync history yet.'),
            ),
          );
        }

        final logs = snapshot.data!;
        if (logs.isEmpty) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('No sync logs.'),
            ),
          );
        }

        return Card(
          child: Column(
            children: logs.map((log) {
              Color statusColor;
              IconData statusIcon;

              switch (log.status) {
                case 0: // Start
                  statusColor = Colors.blue;
                  statusIcon = Icons.sync;
                  break;
                case 1: // Success
                  statusColor = Colors.green;
                  statusIcon = Icons.check_circle;
                  break;
                case 2: // Failure
                  statusColor = Colors.red;
                  statusIcon = Icons.error;
                  break;
                default:
                  statusColor = Colors.grey;
                  statusIcon = Icons.help;
              }

              return ListTile(
                leading: Icon(statusIcon, color: statusColor),
                title: Text('${log.syncType} Sync'),
                subtitle: Text(log.message ?? ''),
                trailing: Text(
                  log.timestamp.split('T').last.split('.').first,
                  style: const TextStyle(fontSize: 12),
                ),
                dense: true,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildInfoCard(Map<String, String> data) {
    return Card(
      elevation: 2,
      child: Column(
        children: data.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            subtitle: Text(entry.value),
            dense: true,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCountCard(Map<String, int> data) {
    return Card(
      elevation: 2,
      child: Column(
        children: data.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: entry.value > 0
                    ? Colors.red.withValues(alpha: 0.1)
                    : Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                entry.value.toString(),
                style: TextStyle(
                  color: entry.value > 0 ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            dense: true,
          );
        }).toList(),
      ),
    );
  }
}
