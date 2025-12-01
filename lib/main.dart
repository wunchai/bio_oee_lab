// lib/main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bio_oee_lab/core/app_theme.dart';
import 'package:bio_oee_lab/core/app_routes.dart';
import 'package:bio_oee_lab/core/app_providers.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  final appDatabase = await AppDatabase.instance();

  final userApiService = UserApiService();
  final deviceInfoService = DeviceInfoService();
  await deviceInfoService.loadInfo();

  final loginRepository = LoginRepository(
    userDao: appDatabase.userDao,
    userApiService: userApiService,
    deviceInfoService: deviceInfoService,
  );

  await loginRepository.getLoggedInUserFromLocal();
  final bool isLoggedIn = loginRepository.isLoggedIn;

  final providers = await appProviders(appDatabase);

  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(initialRoute: isLoggedIn ? '/main_wrapper' : '/login'),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bio OEE Lab',
      theme: appTheme(),
      initialRoute: initialRoute,
      routes: appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
