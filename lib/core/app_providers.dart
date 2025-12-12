// lib/core/app_providers.dart
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';
import 'package:bio_oee_lab/data/network/sync_api_service.dart';
import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/data/network/job_api_service.dart';
import 'package:bio_oee_lab/data/network/job_sync_api_service.dart';
import 'package:bio_oee_lab/data/repositories/job_repository.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';
import 'package:bio_oee_lab/data/repositories/check_in_repository.dart';
import 'package:bio_oee_lab/data/repositories/activity_repository.dart';
import 'package:bio_oee_lab/data/network/machine_api_service.dart';
import 'package:bio_oee_lab/data/repositories/machine_repository.dart';
import 'package:bio_oee_lab/data/network/activity_api_service.dart';
import 'package:bio_oee_lab/data/repositories/info_repository.dart';
import 'package:bio_oee_lab/data/repositories/job_sync_repository.dart';

Future<List<SingleChildWidget>> appProviders(AppDatabase appDatabase) async {
  final deviceInfoService = DeviceInfoService();
  final userApiService = UserApiService();
  final syncApiService = SyncApiService();
  final jobApiService = JobApiService();
  final machineApiService = MachineApiService();
  final jobSyncApiService = JobSyncApiService();

  final dbProvider = Provider<AppDatabase>.value(value: appDatabase);

  final runningJobDetailsDao = appDatabase.runningJobDetailsDao;
  final pauseReasonDao = appDatabase.pauseReasonDao;
  final checkInDao = appDatabase.checkInDao;
  final activityLogDao = appDatabase.activityLogDao;

  final loginRepository = LoginRepository(
    userDao: appDatabase.userDao,
    userApiService: userApiService,
    deviceInfoService: deviceInfoService,
  );

  final jobRepository = JobRepository(
    apiService: jobApiService,
    jobDao: appDatabase.jobDao,
  );

  final machineRepository = MachineRepository(
    apiService: machineApiService,
    machineDao: appDatabase.machineDao,
    machineSummaryDao: appDatabase.machineSummaryDao,
  );

  final jobSyncRepository = JobSyncRepository(
    appDatabase: appDatabase,
    apiService: jobSyncApiService,
  );

  final syncRepository = SyncRepository(
    syncApiService: syncApiService,
    userDao: appDatabase.userDao,
    syncLogDao: appDatabase.syncLogDao,
    jobRepository: jobRepository,
    machineRepository: machineRepository,
    jobSyncRepository: jobSyncRepository,
  );

  final documentRepository = DocumentRepository(appDatabase: appDatabase);
  final checkInRepository = CheckInRepository(appDatabase: appDatabase);

  final activityApiService = ActivityApiService();
  final activityRepository = ActivityRepository(
    appDatabase: appDatabase,
    apiService: activityApiService,
  );

  return [
    dbProvider,
    Provider<DeviceInfoService>.value(value: deviceInfoService),
    Provider.value(value: runningJobDetailsDao),
    Provider.value(value: pauseReasonDao),
    Provider.value(value: checkInDao),
    Provider.value(value: checkInRepository),
    Provider.value(value: activityLogDao),
    ChangeNotifierProvider.value(value: activityRepository),
    ChangeNotifierProvider<LoginRepository>(
      create: (context) => loginRepository,
    ),
    ChangeNotifierProvider.value(value: jobRepository),
    ChangeNotifierProvider.value(value: machineRepository),
    Provider.value(value: jobSyncRepository),
    ChangeNotifierProvider.value(value: syncRepository),
    Provider<DocumentRepository>.value(value: documentRepository),
    Provider<InfoRepository>(
      create: (context) => InfoRepository(
        appDatabase: appDatabase,
        deviceInfoService: deviceInfoService,
      ),
    ),
  ];
}
