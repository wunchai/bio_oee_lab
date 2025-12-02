import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bio_oee_lab/data/repositories/info_repository.dart';

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
                  _buildSectionTitle('Sync Summary'),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Not implemented yet'),
                    ),
                  ),
                ],
              ),
            ),
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
                    ? Colors.red.withOpacity(0.1)
                    : Colors.green.withOpacity(0.1),
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
