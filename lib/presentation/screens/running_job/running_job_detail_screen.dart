import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/scanner_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/machine_detail_screen.dart';

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
    required String activityType, // ID
    String? activityName, // Name
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
        activityName: activityName,
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

  // ✅ 1. Helper Function: บันทึกลง Database (ใช้ร่วมกันทั้ง Scan และ Manual)
  Future<void> _saveTestSet(String code) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addTestSetByQrCode(
        documentId: widget.documentId,
        qrCode: code,
        userId: userId,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Test Set Added: $code')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // ✅ 2. ฟังก์ชัน Scan QR (ปรับปรุงให้เรียก _saveTestSet)
  Future<void> _handleScanTestSet() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      await _saveTestSet(result);
    }
  }

  // ✅ 3. ฟังก์ชัน Manual Input (ใหม่! ⭐)
  Future<void> _handleManualInputTestSet() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Test Set (Manual)'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Test Set No.',
            hintText: 'Type ID here...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.keyboard),
          ),
          autofocus: true, // ให้เด้งคีย์บอร์ดขึ้นมาเลย
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
      await _saveTestSet(result);
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
      // Find selected reason object
      final reasonObj = reasons.firstWhere(
        (r) => r.reasonName == selectedReason,
      );

      await _performAction(
        activityType: '${reasonObj.reasonCode}', // Use Code as ID
        activityName: reasonObj.reasonName, // Use Name
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
      await _performAction(
        activityType: 'End',
        activityName: 'End Job',
        newStatus: 2,
        label: 'End Job',
      );
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

        // กำลังทำงานอยู่ (มี Log เปิดค้าง และกิจกรรมคือ Work => ID '00')
        final bool isWorking = hasOpenLog && currentLog.activityId == '00';

        // กำลังพักอยู่ (มี Log เปิดค้าง แต่กิจกรรมไม่ใช่ Work)
        final bool isPaused = hasOpenLog && currentLog.activityId != '00';

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
                                activityType: '00',
                                activityName: 'Work',
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
                                activityType: '00',
                                activityName: 'Work',
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
                        final isWork = log.activityId == '00';
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
                          title: Text(
                            log.activityName ?? log.activityId ?? 'Unknown',
                          ),
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

  // --- Tab 2: Test Sets (Updated with Manual Input) ---
  Widget _buildTestSetsTab(AppDatabase db) {
    return Column(
      children: [
        // แถวปุ่มควบคุม
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // ปุ่ม Scan QR
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleScanTestSet,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan QR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ปุ่ม Manual Input (ใหม่! ⭐)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleManualInputTestSet,
                  icon: const Icon(Icons.keyboard),
                  label: const Text('Manual Input'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),

        // รายการ Test Sets (เหมือนเดิม)
        Expanded(
          child: StreamBuilder<List<DbJobTestSet>>(
            stream: db.runningJobDetailsDao.watchTestSetsByDocId(
              widget.documentId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              final items = snapshot.data!;

              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No Test Sets added.\nScan QR or enter manually to start.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: const Icon(
                          Icons.science,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        item.setItemNo ?? 'Unknown Code',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Registered by: ${item.registerUser ?? '-'}',
                      ),
                      trailing: item.syncStatus == 0
                          ? const Icon(
                              Icons.cloud_upload_outlined,
                              color: Colors.grey,
                            )
                          : const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Machine Action Dialogs ---

  // --- Tab 3: Machines (Updated) ---
  Widget _buildMachinesTab(AppDatabase db) {
    return Column(
      children: [
        // 1. แถวปุ่มควบคุม (Scan & Manual)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // ปุ่ม Scan QR
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleScanMachine,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Scan Machine'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // ใช้สีม่วงแยกความแตกต่าง
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ปุ่ม Manual Input
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

        // 2. รายการ Machines
        Expanded(
          child: StreamBuilder<List<DbRunningJobMachine>>(
            // เรียก watchMachinesByDocId จาก DAO
            stream: db.runningJobDetailsDao.watchMachinesByDocId(
              widget.documentId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              final items = snapshot.data!;

              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No Machines added.\nScan QR or enter manually to start.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  final item = items[index];
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
                        item.machineNo ?? 'Unknown Machine',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Registered by: ${item.registerUser ?? '-'}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MachineDetailScreen(
                              machine: item,
                              documentId: widget.documentId,
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
    );
  }

  // -------------------------------------------------------
  // ⚙️ Machine Actions (Scan & Manual)
  // -------------------------------------------------------

  // 1. Helper Function: บันทึก Machine ลง Database
  Future<void> _saveMachine(String code) async {
    try {
      final repo = context.read<DocumentRepository>();
      final loginRepo = context.read<LoginRepository>();
      final userId = loginRepo.loggedInUser?.userId ?? 'Unknown';

      await repo.addMachineByQrCode(
        documentId: widget.documentId,
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  // 2. ฟังก์ชัน Scan Machine QR
  Future<void> _handleScanMachine() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result.isNotEmpty) {
      await _saveMachine(result);
    }
  }

  // 3. ฟังก์ชัน Manual Input Machine
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
}
