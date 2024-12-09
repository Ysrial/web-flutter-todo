import 'package:get_it/get_it.dart';
import 'package:web_flutter_todo/services/storage_service.dart';
import 'package:web_flutter_todo/services/task_service.dart';
import 'package:web_flutter_todo/services/storage_service_interface.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<StorageServiceInterface>(() => StorageService());
  getIt.registerLazySingleton(
      () => TaskService(storage: getIt<StorageServiceInterface>()));
}
