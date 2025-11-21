import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';

class RunningJobDetailScreen extends StatefulWidget {
  final String documentId;

  const RunningJobDetailScreen({super.key, required this.documentId});

  @override
  State<RunningJobDetailScreen> createState() => _RunningJobDetailScreenState();
}

class _RunningJobDetailScreenState extends State<RunningJobDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _remarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------
  // 🛠️ Action Logic
  // -------------------------------------------------------

  Future<void> _performAction({
    required String activityType,
    required int newStatus,
    String label = 'Action',
  }) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.handleUserAction(
        documentId: widget.documentId,
        userId: userId,
        activityType: activityType,
        newDocStatus: newStatus,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label Successful')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _handlePause() async {
    // 1. เตรียมข้อมูล
    final db = Provider.of<AppDatabase>(context, listen: false);
    // (Optional: Seed ข้อมูลถ้ายังไม่มี เพื่อให้เทสได้เลย)
    await db.pauseReasonDao.seedDefaultReasons();

    // ดึงรายการเหตุผล
    final reasons = await db.pauseReasonDao.getActiveReasons();

    // ตัวแปรเก็บค่าที่เลือก
    String? selectedReason;

    // 2. แสดง Dialog
    final shouldPause = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          // ใช้ StatefulBuilder เพื่อให้ Dropdown อัปเดตค่าได้ใน Dialog
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Pause Job'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select reason:'),
                    const SizedBox(height: 10),
                    if (reasons.isEmpty)
                      const Text(
                        'No reasons defined in Master Data.',
                        style: TextStyle(color: Colors.red),
                      )
                    else
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                        ),
                        hint: const Text('Choose a reason...'),
                        value: selectedReason,
                        items: reasons
                            .map(
                              (r) => DropdownMenuItem(
                                value: r.reasonName,
                                child: Text(r.reasonName ?? '-'),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedReason = val;
                          });
                        },
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  // ต้องเลือกเหตุผลก่อนถึงจะกดได้ (หรือจะยอมให้ว่างก็ได้แล้วแต่ Logic)
                  onPressed: selectedReason == null
                      ? null
                      : () => Navigator.pop(ctx, true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Pause'),
                ),
              ],
            );
          },
        );
      },
    );

    // 3. ถ้ากดตกลง บันทึกข้อมูล
    if (shouldPause == true && selectedReason != null) {
      await _performAction(
        activityType: selectedReason!, // ส่งชื่อเหตุผลไปบันทึก
        newStatus: 1,
        label: 'Pause',
      );
    }
  }

  Future<void> _handleEnd() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('End Job'),
        content: const Text('Are you sure you want to finish this job?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirm End'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _performAction(activityType: 'End', newStatus: 2, label: 'End Job');
    }
  }

  // -------------------------------------------------------
  // 🎨 UI Construction
  // -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Detail'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.access_time), text: 'Work & Time'),
            Tab(icon: Icon(Icons.science), text: 'Test Sets'),
            Tab(icon: Icon(Icons.precision_manufacturing), text: 'Machines'),
          ],
        ),
      ),
      body: StreamBuilder<DbDocument?>(
        stream: db.documentDao.watchDocumentById(widget.documentId),
        builder: (context, docSnapshot) {
          if (!docSnapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final doc = docSnapshot.data;
          if (doc == null)
            return const Center(child: Text('Document not found'));

          return Column(
            children: [
              // 1. Header Info (แสดงตลอด)
              _buildHeader(doc),

              // 2. Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Work Timeline & Controls
                    _buildWorkTab(db, doc),

                    // Tab 2: Test Sets List
                    _buildTestSetsTab(db),

                    // Tab 3: Machines List
                    _buildMachinesTab(db),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader(DbDocument doc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(bottom: BorderSide(color: Colors.blue.shade100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.documentName ?? 'Untitled',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Job ID: ${doc.jobId}',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          _buildStatusBadge(doc.status),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(int status) {
    Color color;
    String text;
    switch (status) {
      case 0:
        color = Colors.grey;
        text = 'Draft';
        break;
      case 1:
        color = Colors.orange;
        text = 'Running';
        break;
      case 2:
        color = Colors.blue;
        text = 'Ended';
        break;
      case 3:
        color = Colors.green;
        text = 'Posted';
        break;
      default:
        color = Colors.red;
        text = 'Unknown';
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- Tab 1: Work & Time ---
  Widget _buildWorkTab(AppDatabase db, DbDocument doc) {
    return StreamBuilder<List<DbJobWorkingTime>>(
      stream: db.runningJobDetailsDao.watchUserLogs(widget.documentId),
      builder: (context, logsSnapshot) {
        final logs = logsSnapshot.data ?? [];

        // 1. หา Log ล่าสุด (ถ้ามี)
        // ถ้ามี Log ที่เปิดค้างอยู่ (endTime == null) ให้เอาอันนั้น
        // ถ้าไม่มีเลย หรือปิดหมดแล้ว ให้เอาอันล่าสุด (ตัวแรก)
        final currentLog = logs.isEmpty
            ? null
            : logs.firstWhere(
                (l) => l.endTime == null,
                orElse: () => logs.first,
              );

        // 2. เช็คสถานะให้ชัวร์ (ป้องกัน null)
        // มี Log เปิดค้างอยู่จริงไหม?
        final bool hasOpenLog =
            currentLog != null && currentLog.endTime == null;

        // กำลังทำงานอยู่ (มี Log เปิดค้าง และกิจกรรมคือ Work)
        final bool isWorking = hasOpenLog && currentLog.activityId == 'Work';

        // กำลังพักอยู่ (มี Log เปิดค้าง แต่กิจกรรมไม่ใช่ Work)
        final bool isPaused = hasOpenLog && currentLog.activityId != 'Work';

        final bool isEnded = doc.status == 2;

        return Column(
          children: [
            // ปุ่ม Control (ถ้ายังไม่จบงาน)
            if (!isEnded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: !isWorking && !isPaused
                          ? _buildBigButton(
                              'START WORK',
                              Colors.green,
                              Icons.play_arrow,
                              () => _performAction(
                                activityType: 'Work',
                                newStatus: 1,
                                label: 'Start',
                              ),
                            )
                          : isPaused
                          ? _buildBigButton(
                              'RESUME',
                              Colors.green,
                              Icons.play_arrow,
                              () => _performAction(
                                activityType: 'Work',
                                newStatus: 1,
                                label: 'Resume',
                              ),
                            )
                          : _buildBigButton(
                              'PAUSE',
                              Colors.orange,
                              Icons.pause,
                              _handlePause,
                            ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildBigButton(
                        'END JOB',
                        Colors.red,
                        Icons.stop,
                        _handleEnd,
                      ),
                    ),
                  ],
                ),
              ),

            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Activity Timeline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            // Timeline List
            Expanded(
              child: logs.isEmpty
                  ? const Center(child: Text('No activity recorded yet.'))
                  : ListView.builder(
                      itemCount: logs.length,
                      itemBuilder: (context, index) {
                        final log = logs[index];
                        final isWork = log.activityId == 'Work';
                        final start = DateTime.tryParse(log.startTime ?? '');
                        final end = DateTime.tryParse(log.endTime ?? '');

                        final duration = end != null
                            ? end.difference(start!)
                            : DateTime.now().difference(start!);
                        final durationStr =
                            '${duration.inHours}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s';

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isWork
                                ? Colors.green.shade100
                                : Colors.orange.shade100,
                            child: Icon(
                              isWork ? Icons.work : Icons.coffee,
                              color: isWork ? Colors.green : Colors.orange,
                              size: 20,
                            ),
                          ),
                          title: Text(log.activityId ?? 'Unknown'),
                          subtitle: Text(
                            'Start: ${DateFormat('HH:mm:ss').format(start!)}',
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                durationStr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (end == null)
                                const Text(
                                  'Running...',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBigButton(
    String text,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // --- Tab 2: Test Sets ---
  Widget _buildTestSetsTab(AppDatabase db) {
    return StreamBuilder<List<DbJobTestSet>>(
      stream: db.runningJobDetailsDao.watchTestSetsByDocId(widget.documentId),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final items = snapshot.data!;
        if (items.isEmpty)
          return const Center(child: Text('No Test Sets for this job.'));

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: const Icon(Icons.science, color: Colors.blue),
                title: Text('Set Item No: ${item.setItemNo ?? '-'}'),
                subtitle: Text('Status: ${item.status}'),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          },
        );
      },
    );
  }

  // --- Tab 3: Machines ---
  Widget _buildMachinesTab(AppDatabase db) {
    return StreamBuilder<List<DbRunningJobMachine>>(
      stream: db.runningJobDetailsDao.watchMachinesByDocId(widget.documentId),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());
        final items = snapshot.data!;
        if (items.isEmpty)
          return const Center(child: Text('No Machines for this job.'));

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: const Icon(
                  Icons.precision_manufacturing,
                  color: Colors.purple,
                ),
                title: Text('Machine No: ${item.machineNo ?? '-'}'),
                subtitle: Text('Status: ${item.status}'),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          },
        );
      },
    );
  }
}
