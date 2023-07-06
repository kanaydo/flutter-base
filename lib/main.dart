

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_container_cubit.dart';
import 'di/di.dart';
import 'di/injection.dart';
import 'presentation/features/auth/auth_page.dart';
import 'presentation/features/dashboard/dashboard_page.dart';
import 'utils/configs/session_manager.dart';

void main() async {
  await initializeServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox(SessionManager.kBaseSession);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AppContainerCubit(
            sessionManager: injection<SessionManager>()
        ),
        child: const AppContainer(),
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppContainerCubit, AppContainerState>(
        builder: (context, state) {
          if (state is AppContainerUnauthenticated) {
            return const AuthPage();
          } else if (state is AppContainerAuthenticated) {
            return const DashboardPage();
          } else {
            return Container();
          }
        }
    );
  }
}
