// lib/presentation/screens/main_wrapper/main_wrapper_screen.dart

import 'package:flutter/material.dart';
import 'package:bio_oee_lab/presentation/screens/job/job_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/running_job_screen.dart';

// --- Placeholder Screens (หน้าชั่วคราว ระหว่างรอคุณอธิบายรายละเอียด) ---
class JobScreenPlaceholder extends StatelessWidget {
  const JobScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Page 1: JOB List'));
}

class RunningJobScreenPlaceholder extends StatelessWidget {
  const RunningJobScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Page 2: Running Job'));
}

class CheckInScreenPlaceholder extends StatelessWidget {
  const CheckInScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Page 3: Check-In / Check-Out'));
}

class ActivityScreenPlaceholder extends StatelessWidget {
  const ActivityScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Page 4: Activity Recording'));
}

class MachineScreenPlaceholder extends StatelessWidget {
  const MachineScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Page 5: Machine Status'));
}

// --- Main Wrapper (ตัวจัดการ Tab) ---
class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  int _currentIndex = 0;

  // รายการหน้าทั้ง 5
  final List<Widget> _pages = const [
    JobScreen(),
    RunningJobScreen(),
    CheckInScreenPlaceholder(),
    ActivityScreenPlaceholder(),
    MachineScreenPlaceholder(),
  ];

  // รายการชื่อ Tab สำหรับ AppBar (ถ้าต้องการเปลี่ยนชื่อตาม Tab)
  final List<String> _titles = const [
    'All Jobs',
    'Running Job',
    'Check-In / Out',
    'Activity',
    'Machines',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        actions: [
          // ปุ่ม Logout ชั่วคราว (เผื่อไว้ test)
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: ใส่ Logic Logout ที่นี่
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Jobs'),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            selectedIcon: Icon(Icons.play_circle_fill),
            label: 'Running',
          ),
          NavigationDestination(icon: Icon(Icons.login), label: 'Check-In'),
          NavigationDestination(
            icon: Icon(Icons.engineering),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Icon(Icons.precision_manufacturing),
            label: 'Machine',
          ),
        ],
      ),
    );
  }
}
