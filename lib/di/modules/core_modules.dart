

import '../../core/db/app_database.dart';
import '../../core/db/connection/connection.dart';
import '../../core/network/api_client.dart';
import '../../utils/configs/session_manager.dart';
import '../../utils/security_provider.dart';
import '../injection.dart';

Future<void> initializeCoreModules() async {
  injection.registerLazySingleton(() => SecurityProvider());

  injection.registerLazySingleton<SessionManager>(() {
    return SessionManager(securityProvider: injection<SecurityProvider>());
  });

  injection.registerLazySingleton<AppDatabase>(() => constructDb());

  injection.registerLazySingleton<ApiClient>(() {
    return ApiClient(sessionManager: injection<SessionManager>());
  });
}