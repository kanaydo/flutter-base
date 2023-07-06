import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/configs/session_manager.dart';

part 'app_container_state.dart';

class AppContainerCubit extends Cubit<AppContainerState> {
  final SessionManager sessionManager;

  AppContainerCubit({required this.sessionManager}) : super(AppContainerUnauthenticated()) {
    _validateAuth();
  }

  void _validateAuth() {
    final session = sessionManager.getLocalSession();
    if (session != null) {
      emit(AppContainerAuthenticated());
    }
  }
}
