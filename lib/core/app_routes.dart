// lib/core/app_routes.dart
import 'package:flutter/material.dart';

// --- ⚠️ เราต้องสร้างไฟล์เหล่านี้ในอนาคต ---
import 'package:bio_oee_lab/presentation/screens/login/login_screen.dart'; // <<< เพิ่ม Import
// import 'package:bio_oee_lab/presentation/screens/main_wrapper/main_wrapper_screen.dart';
import 'package:bio_oee_lab/presentation/screens/main_wrapper/main_wrapper_screen.dart';

// หน้าจอเปล่าๆ สำหรับใช้ชั่วคราว
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Welcome to $title!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

// ฟังก์ชันที่คืนค่า Map ของ Routes ทั้งหมด
Map<String, WidgetBuilder> appRoutes() {
  return {
    '/login': (context) =>
        const LoginScreen(), // <<< เปลี่ยนมาใช้ LoginScreen จริง
    '/main_wrapper': (context) =>
        const MainWrapperScreen(), // (ยังใช้หน้าเปล่าไปก่อน)าไปก่อน)

    /*
    '/main_wrapper': (context) =>
        const PlaceholderScreen(title: 'Main App'), // (ยังใช้หน้าเปล่าไปก่อน)
 */
  };
}
