import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/repositories/machine_repository.dart';

class MachineScreen extends StatefulWidget {
  const MachineScreen({super.key});

  @override
  State<MachineScreen> createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _handleSync(BuildContext context) async {
    final loginRepo = context.read<LoginRepository>();
    final userId = loginRepo.loggedInUser?.userId ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please login first.')));
      return;
    }

    final success = await context.read<MachineRepository>().syncMachines(
      userId,
    );

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Machines synced successfully!')),
        );
      } else {
        final msg = context.read<MachineRepository>().syncMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final machineRepo = context.watch<MachineRepository>();
    final isSyncing = machineRepo.status == MachineSyncStatus.syncing;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Machines'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: _buildSearchBar(),
          ),
        ),
        actions: [
          IconButton(
            icon: isSyncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.sync),
            onPressed: isSyncing ? null : () => _handleSync(context),
          ),
        ],
      ),
      body: Column(
        children: [
          if (isSyncing)
            Container(
              color: Colors.orange.shade50,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                machineRepo.syncMessage,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange.shade800),
              ),
            ),
          Expanded(
            child: StreamBuilder<List<DbMachine>>(
              stream: machineRepo.watchMachines(_searchQuery),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final machines = snapshot.data!;

                if (machines.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.precision_manufacturing_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No machines found.\nTap sync button to fetch data.'
                              : 'No result for "$_searchQuery"',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: machines.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final machine = machines[index];
                    return _buildMachineCard(machine);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search Machine...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildMachineCard(DbMachine machine) {
    Color statusColor;
    IconData statusIcon;

    // Determine color based on status (Case-insensitive)
    final status = machine.status?.toLowerCase() ?? '';
    if (status == 'running') {
      statusColor = Colors.green;
      statusIcon = Icons.play_circle_fill;
    } else if (status == 'setup') {
      statusColor = Colors.blue;
      statusIcon = Icons.settings;
    } else if (status == 'clean') {
      statusColor = Colors.cyan;
      statusIcon = Icons.cleaning_services;
    } else if (status == 'standby') {
      statusColor = Colors.orange;
      statusIcon = Icons.pause_circle_filled;
    } else if (status == 'breakdown') {
      statusColor = Colors.red;
      statusIcon = Icons.warning;
    } else {
      statusColor = Colors.grey;
      statusIcon = Icons.help;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Status Icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon, color: statusColor, size: 28),
            ),
            const SizedBox(width: 16),
            // Machine Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    machine.machineName ?? 'Unknown Name',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${machine.machineNo} (${machine.machineId})',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                ],
              ),
            ),
            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                machine.status ?? 'Unknown',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
