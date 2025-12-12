import 'package:bio_oee_lab/core/app_providers.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/machine_repository.dart';
import 'package:bio_oee_lab/data/database/daos/machine_summary_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MachineSummaryScreen extends StatefulWidget {
  final String machineId;
  final String machineName;

  const MachineSummaryScreen({
    Key? key,
    required this.machineId,
    required this.machineName,
  }) : super(key: key);

  @override
  State<MachineSummaryScreen> createState() => _MachineSummaryScreenState();
}

class _MachineSummaryScreenState extends State<MachineSummaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleSync() async {
    final machineRepo = context.read<MachineRepository>();
    // TODO: Get real userId
    final userId = '1';
    await machineRepo.syncMachineSummary(userId, widget.machineId);
  }

  @override
  Widget build(BuildContext context) {
    // We access the DAO directly via provider or through repository if exposed
    // But since DAOs are in AppDatabase, and we have provider for database...
    final db = Provider.of<AppDatabase>(context);
    final dao = db.machineSummaryDao;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.machineName} Summary'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Test Sets'),
            Tab(text: 'Event Log'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: _handleSync,
            tooltip: 'Sync API',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(dao),
          _buildTestSetsTab(dao),
          _buildEventLogTab(dao),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(MachineSummaryDao dao) {
    return StreamBuilder<DbMachineSummary?>(
      stream: dao.watchSummary(widget.machineId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('No Data. Tap Sync to fetch.'));
        }
        final data = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildInfoCard(
              'Machine Status',
              data.status ?? '-',
              Colors.blue.shade100,
            ),
            _buildInfoCard(
              'Current Job',
              data.currentJobName ?? 'N/A',
              Colors.grey.shade200,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    'OEE',
                    data.oeePercent,
                    Colors.purple.shade100,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildKpiCard(
                    'Avail',
                    data.availability,
                    Colors.orange.shade100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    'Perf',
                    data.performance,
                    Colors.green.shade100,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildKpiCard(
                    'Qual',
                    data.quality,
                    Colors.red.shade100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Last Updated: ${data.updatedAt != null ? DateFormat('MM/dd HH:mm').format(DateTime.parse(data.updatedAt!)) : 'Never'}',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoCard(String title, String value, Color color) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildKpiCard(String title, double value, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              '${value.toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestSetsTab(MachineSummaryDao dao) {
    return StreamBuilder<List<DbMachineSummaryItem>>(
      stream: dao.watchSummaryItems(widget.machineId),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Test Sets found.'));
        }
        final items = snapshot.data!;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.testSetName ?? 'Unknown Test Set'),
              subtitle: Text(
                '${item.jobName ?? "Unknown Job"}\nStatus: ${item.status ?? "-"}',
              ),
              trailing: Text(
                item.registerDateTime != null
                    ? DateFormat(
                        'MM/dd HH:mm',
                      ).format(DateTime.parse(item.registerDateTime!))
                    : '',
              ),
              isThreeLine: true,
            );
          },
        );
      },
    );
  }

  Widget _buildEventLogTab(MachineSummaryDao dao) {
    return StreamBuilder<List<DbMachineSummaryEvent>>(
      stream: dao.watchSummaryEvents(widget.machineId),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Events found.'));
        }
        final events = snapshot.data!;
        return ListView.separated(
          itemCount: events.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final event = events[index];
            return ListTile(
              leading: Icon(_getEventIcon(event.eventType)),
              title: Text(event.eventType ?? 'Unknown Event'),
              subtitle: Text(
                'Duration: ${event.durationSeconds}s\nUser: ${event.recordUserId}',
              ),
              trailing: Text(
                event.startTime != null
                    ? DateFormat(
                        'HH:mm',
                      ).format(DateTime.parse(event.startTime!))
                    : '',
              ),
            );
          },
        );
      },
    );
  }

  IconData _getEventIcon(String? eventType) {
    if (eventType == null) return Icons.event;
    final lower = eventType.toLowerCase();
    if (lower.contains('start')) return Icons.play_arrow;
    if (lower.contains('stop')) return Icons.stop;
    if (lower.contains('pause')) return Icons.pause;
    return Icons.info_outline;
  }
}
