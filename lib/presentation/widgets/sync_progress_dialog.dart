// lib/presentation/widgets/sync_progress_dialog.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/repositories/sync_repository.dart';

class SyncProgressDialog extends StatelessWidget {
  const SyncProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // เราใช้ Consumer เพื่อ "ฟัง" การเปลี่ยนแปลงใน SyncRepository
    return Consumer<SyncRepository>(
      builder: (context, syncRepo, child) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              // แสดงข้อความล่าสุดจาก Repository (เช่น 'Syncing users...')
              Text(
                syncRepo.lastSyncMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
