// lib/data/models/login_result.dart

// (โมเดลนี้ไม่จำเป็นต้อง import อะไรเป็นพิเศษ)

enum LoginStatus {
  success,
  invalidCredentials,
  serverError,
  networkError,
  unknownError,
  userNotFound, // เพิ่มสถานะ: ไม่พบผู้ใช้
}

class LoginResult {
  final LoginStatus status;
  final String? message; // ข้อความ (เช่น "รหัสผ่านผิด")
  // (คุณสามารถเพิ่มข้อมูล User ที่ได้กลับมา ที่นี่ได้ในอนาคต)

  LoginResult({required this.status, this.message});
}
