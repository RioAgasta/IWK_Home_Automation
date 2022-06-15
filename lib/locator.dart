import 'package:get_it/get_it.dart';
import 'package:homeauto/common/snackbar_service.dart';
import 'package:homeauto/services/alert_service.dart';
import 'package:homeauto/services/navgation_service.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RmqService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => SnackbarService());
}