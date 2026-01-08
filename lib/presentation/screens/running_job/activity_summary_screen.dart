import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class ActivitySummaryScreen extends StatelessWidget {
  final String documentId;
  final String documentName;

  const ActivitySummaryScreen({
    super.key,
    required this.documentId,
    required this.documentName,
  });

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Summary: $documentName')),
      body: StreamBuilder<List<DbHumanActivityType>>(
        // 1. Get All Configured Activities
        stream: db.humanActivityTypeDao.watchActiveActivities(documentId),
        builder: (context, actSnapshot) {
          if (!actSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final activities = actSnapshot.data!;

          return StreamBuilder<List<DbJobWorkingTime>>(
            // 2. Get All User Logs
            stream: db.runningJobDetailsDao.watchUserLogs(documentId),
            builder: (context, logSnapshot) {
              if (logSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final logs = logSnapshot.data ?? [];

              // 3. Aggregate Data
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final act = activities[index];
                  final actLogs = logs
                      .where((l) => l.activityId == act.activityCode)
                      .toList();

                  // Stats
                  final count = actLogs.length;
                  final isStarted = count > 0;
                  // If any log is open (endTime null), it's in progress
                  final isInProgress = actLogs.any(
                    (l) => l.endTime == null && l.status == 1,
                  );

                  // Status Logic
                  String statusText = 'Pending';
                  Color statusColor = Colors.grey;
                  IconData statusIcon = Icons.schedule;

                  if (isInProgress) {
                    statusText = 'In Progress';
                    statusColor = Colors.blue;
                    statusIcon = Icons.timelapse;
                  } else if (isStarted) {
                    statusText = 'Completed';
                    statusColor = Colors.green;
                    statusIcon = Icons.check_circle;
                  }

                  // Times
                  String timeInfo = '-';
                  if (isStarted) {
                    // Sort by time just in case
                    actLogs.sort(
                      (a, b) =>
                          (a.startTime ?? '').compareTo(b.startTime ?? ''),
                    );

                    final firstStart = DateTime.tryParse(
                      actLogs.first.startTime ?? '',
                    );
                    final lastEndLog = actLogs.last; // Could be open
                    final lastEnd = lastEndLog.endTime != null
                        ? DateTime.tryParse(lastEndLog.endTime!)
                        : null; // Still running

                    final f = DateFormat('HH:mm');
                    final startStr = firstStart != null
                        ? f.format(firstStart)
                        : '?';
                    final endStr = lastEnd != null
                        ? f.format(lastEnd)
                        : (isInProgress ? 'Now' : '?');

                    timeInfo = '$startStr - $endStr';
                  }

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: statusColor.withOpacity(0.1),
                        child: Icon(statusIcon, color: statusColor),
                      ),
                      title: Text(
                        act.activityName ?? act.activityCode ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              // Status Chip
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: statusColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  statusText,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: statusColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Count
                              Text(
                                'Count: $count',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text('Time: $timeInfo'),
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
    );
  }
}
