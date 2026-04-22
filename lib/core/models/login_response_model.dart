class LoginResponse {
  final String email;
  final String refreshToken;
  final List<String> roles;
  final String token;

  LoginResponse({
    required this.email,
    required this.refreshToken,
    required this.roles,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email: json['email'] as String,
      refreshToken: json['refreshToken'] as String,
      roles: List<String>.from(json['roles'] as List),
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'refreshToken': refreshToken,
      'roles': roles,
      'token': token,
    };
  }
}