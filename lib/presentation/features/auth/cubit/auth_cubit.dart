

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/configs/session_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SessionManager sessionManager;
  AuthCubit({required this.sessionManager}) : super(AuthInitial());

  void onSubmit() {
    emit(AuthLoading());
  }

  void togglePassword() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }
}
