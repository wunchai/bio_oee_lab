// lib/presentation/screens/login/login_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/models/login_result.dart'; // สำหรับ LoginStatus
import 'package:bio_oee_lab/presentation/screens/login/form_states/login_form_state.dart';
import 'package:bio_oee_lab/presentation/widgets/error_dialog.dart'; // <<< ต้องสร้างไฟล์นี้ในภายหลัง

import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/sync_progress_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ใช้ ChangeNotifierProvider.value เพื่อสร้าง state ของฟอร์ม
    // โดยให้ FormState เป็นตัวจัดการข้อมูลในช่องกรอก (local UI state)
    return ChangeNotifierProvider(
      create: (_) => LoginFormState(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent();

  void _onLoginResult(BuildContext context, LoginResult result) {
    final formState = Provider.of<LoginFormState>(context, listen: false);
    formState.setIsLoading(false); // หยุดโหลดเสมอ

    if (result.status == LoginStatus.success) {
      // Login สำเร็จ: นำทางไปยังหน้าหลัก
      Navigator.of(context).pushReplacementNamed('/main_wrapper');

      // --- นี่คือ Logic ใหม่ที่เราเพิ่ม ---
    } else if (result.status == LoginStatus.userNotFoundOffline) {
      // ถ้าหา User ไม่เจอ (ต้อง Sync)
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('User Not Found'),
          content: Text(
            result.message ??
                'This user is not in the local database. Please sync users first.',
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    } else {
      // Login ล้มเหลวอื่นๆ (รหัสผิด, network error ตอน login ครั้งแรก)
      showDialog(
        context: context,
        builder: (ctx) => ErrorDialog(
          title: 'Login Failed',
          content: result.message ?? 'Unknown error occurred.',
        ),
      );
    }
  }

  Future<void> _handleLogin(
    BuildContext context,
    LoginRepository repository,
  ) async {
    final formState = Provider.of<LoginFormState>(context, listen: false);

    // 1. ตรวจสอบข้อมูลก่อนส่ง
    if (formState.username.isEmpty || formState.password.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => const ErrorDialog(
          title: 'Input Error',
          content: 'Please enter both username and password.',
        ),
      );
      return;
    }

    // 2. เริ่มต้นสถานะการโหลด
    formState.setIsLoading(true);

    // 3. เรียก Repository (Logic ส่วนใหญ่จะอยู่ใน Repository)
    final result = await repository.login(
      formState.username,
      formState.password,
    );

    // 4. จัดการผลลัพธ์
    // (เราใช้ _onLoginResult เป็นตัวจัดการผลลัพธ์แยกต่างหาก)
    _onLoginResult(context, result);
  }

  Future<void> _handleSyncUsers(BuildContext context) async {
    // ดึง SyncRepository มา
    final syncRepository = Provider.of<SyncRepository>(context, listen: false);

    // 1. แสดงหน้าต่าง "กำลัง Sync..." (ที่เราสร้างในขั้นตอนที่ 5)
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const SyncProgressDialog(),
    );

    // 2. สั่งให้ Repository ทำงาน
    final bool success = await syncRepository.syncAllUsers();

    // 3. ปิดหน้าต่าง "กำลัง Sync..."
    Navigator.of(context, rootNavigator: true).pop();

    // 4. แสดงผลลัพธ์ (สำเร็จ หรือ ล้มเหลว)
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(success ? 'Sync Complete' : 'Sync Failed'),
        content: Text(syncRepository.lastSyncMessage),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // LoginRepository เป็น Global State ที่ถูกสร้างไว้ใน main.dart
    final loginRepository = Provider.of<LoginRepository>(context);

    // LoginFormState เป็น Local State สำหรับหน้า Login นี้
    final formState = Provider.of<LoginFormState>(context);

    final syncState = context.watch<SyncRepository>().syncStatus;
    final bool isBusy = formState.isLoading || syncState == SyncStatus.syncing;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 1. Logo (สมมติว่ามี)
              Image.asset('assets/images/logo.png', height: 100),

              const SizedBox(height: 30),

              Text(
                'Bio OEE Lab',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text('Please log in to continue'),

              const SizedBox(height: 30),

              // Username
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: formState.setUsername,
                enabled: !isBusy, // <<< FIX 4: ใช้ isBusy
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: formState.setPassword,
                enabled: !isBusy, // <<< FIX 5: ใช้ isBusy
                onSubmitted: (_) => _handleLogin(context, loginRepository),
              ),
              const SizedBox(height: 30),

              // 4. Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: formState.isLoading
                      ? null
                      : () => _handleLogin(context, loginRepository),
                  child: formState.isLoading
                      ? const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text('LOG IN', style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  icon: syncState == SyncStatus.syncing
                      ? const SizedBox(
                          // ถ้ากำลัง Sync ให้หมุนๆ
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.sync), // สถานะปกติ
                  label: Text(
                    syncState == SyncStatus.syncing
                        ? 'SYNCING...'
                        : 'SYNC USERS',
                  ),
                  onPressed: isBusy ? null : () => _handleSyncUsers(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 5. Device Info (เผื่อใช้ debug)
              Text(
                'Device ID: ${loginRepository.deviceInfoService.getLoginDeviceId()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),

              // 6. Register/Link Button (ถ้ามี)
              TextButton(
                onPressed: isBusy
                    ? null
                    : () {
                        // <<< FIX 8: ใช้ isBusy
                        // TODO: Implement Registration/Device Link Dialog
                      },
                child: const Text('Register Device / Contact Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
