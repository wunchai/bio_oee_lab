// lib/presentation/screens/login/form_states/login_form_state.dart

import 'package:flutter/material.dart';

// คลาสนี้จะเก็บสถานะของฟอร์ม Login เช่น ข้อมูลในช่องกรอก และสถานะการโหลด
class LoginFormState with ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isLoading = false;

  // Getters
  String get username => _username;
  String get password => _password;
  bool get isLoading => _isLoading;

  // Setters
  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Clear function
  void clearForm() {
    _username = '';
    _password = '';
    _isLoading = false;
    notifyListeners();
  }
}
