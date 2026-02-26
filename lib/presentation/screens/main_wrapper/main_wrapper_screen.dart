// lib/presentation/screens/main_wrapper/main_wrapper_screen.dart

import 'package:flutter/material.dart';
import 'package:bio_oee_lab/presentation/screens/job/job_screen.dart';
import 'package:bio_oee_lab/presentation/screens/running_job/running_job_screen.dart';
import 'package:bio_oee_lab/presentation/screens/checkin/check_in_screen.dart';
import 'package:bio_oee_lab/presentation/screens/activity/activity_screen.dart';
import 'package:bio_oee_lab/presentation/screens/machine/machine_screen.dart';
import 'package:bio_oee_lab/presentation/screens/machine/machine_dashboard_screen.dart';
import 'package:bio_oee_lab/presentation/screens/info/info_screen.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    JobScreen(),
    RunningJobScreen(),
    MachineDashboardScreen(),
    ActivityScreen(),
    MachineScreen(),
    CheckInScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          if (index == 5) return; // Disable Check-In
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
          NavigationDestination(
            icon: Icon(Icons.build_circle),
            label: 'M. Job',
          ),
          NavigationDestination(icon: Icon(Icons.engineering), label: 'Setup'),
          NavigationDestination(
            icon: Icon(Icons.precision_manufacturing),
            label: 'Machine',
          ),
          NavigationDestination(
            icon: Icon(Icons.login),
            label: 'Check-In',
            enabled: false,
          ),
          NavigationDestination(icon: Icon(Icons.info_outline), label: 'Info'),
        ],
      ),
    );
  }
}
