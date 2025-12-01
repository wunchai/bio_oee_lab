// lib/core/app_routes.dart
import 'package:flutter/material.dart';

import 'package:bio_oee_lab/presentation/screens/login/login_screen.dart';
import 'package:bio_oee_lab/presentation/screens/main_wrapper/main_wrapper_screen.dart';

Map<String, WidgetBuilder> appRoutes() {
  return {
    '/login': (context) => const LoginScreen(),
    '/main_wrapper': (context) => const MainWrapperScreen(),
  };
}
