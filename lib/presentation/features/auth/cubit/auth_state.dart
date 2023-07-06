part of 'auth_cubit.dart';

@immutable
class AuthState {
  final String username;
  final String password;
  final bool passwordVisible;

  const AuthState({
    this.username = '',
    this.password = '',
    this.passwordVisible = false
  });

  AuthState copyWith({
    String? username,
    String? password,
    bool? passwordVisible
  }) {
    return AuthState(
        username: username ?? this.username,
        password: password ?? this.password,
        passwordVisible: passwordVisible ?? this.passwordVisible
    );
  }
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
