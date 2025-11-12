// lib/presentation/screens/login/login_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/models/login_result.dart'; // สำหรับ LoginStatus
import 'package:bio_oee_lab/presentation/screens/login/form_states/login_form_state.dart';
import 'package:bio_oee_lab/presentation/widgets/error_dialog.dart'; // <<< ต้องสร้างไฟล์นี้ในภายหลัง

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
    formState.setIsLoading(false); // หยุดโหลดเสมอเมื่อได้ผลลัพธ์

    if (result.status == LoginStatus.success) {
      // Login สำเร็จ: นำทางไปยังหน้าหลัก
      // ใช้ pushReplacementNamed เพื่อลบหน้า Login ออกจาก stack
      Navigator.of(context).pushReplacementNamed('/main_wrapper');
    } else {
      // Login ล้มเหลว: แสดงข้อความ Error
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
      BuildContext context, LoginRepository repository) async {
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
    final result =
        await repository.login(formState.username, formState.password);

    // 4. จัดการผลลัพธ์
    // (เราใช้ _onLoginResult เป็นตัวจัดการผลลัพธ์แยกต่างหาก)
    _onLoginResult(context, result);
  }

  @override
  Widget build(BuildContext context) {
    // LoginRepository เป็น Global State ที่ถูกสร้างไว้ใน main.dart
    final loginRepository = Provider.of<LoginRepository>(context);

    // LoginFormState เป็น Local State สำหรับหน้า Login นี้
    final formState = Provider.of<LoginFormState>(context);

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

              Text('Bio OEE Lab',
                  style: Theme.of(context).textTheme.headlineLarge),
              const Text('Please log in to continue'),

              const SizedBox(height: 30),

              // 2. Username Input
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: formState.setUsername,
                enabled: !formState.isLoading,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 16),

              // 3. Password Input
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: formState.setPassword,
                enabled: !formState.isLoading,
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
                                strokeWidth: 2, color: Colors.white),
                          ),
                        )
                      : const Text('LOG IN', style: TextStyle(fontSize: 18)),
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
                onPressed: formState.isLoading
                    ? null
                    : () {
                        // TODO: Implement Registration/Device Link Dialog
                        // showDialog(context: context, builder: (ctx) => const RegisterDialog());
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
