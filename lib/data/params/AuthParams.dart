class AuthParams {
  final String username;
  final String password;

  AuthParams({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password
    };
  }
}