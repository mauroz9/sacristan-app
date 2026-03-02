class LoginResponse {
  final String email;
  final int id;
  final String lastName;
  final String name;
  final String refreshToken;
  final List<String> roles;
  final String token;
  final String username;

  LoginResponse({
    required this.email,
    required this.id,
    required this.lastName,
    required this.name,
    required this.refreshToken,
    required this.roles,
    required this.token,
    required this.username,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email: json['email'] as String,
      id: json['id'] as int,
      lastName: json['lastName'] as String,
      name: json['name'] as String,
      refreshToken: json['refreshToken'] as String,
      roles: List<String>.from(json['roles'] as List),
      token: json['token'] as String,
      username: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'lastName': lastName,
      'name': name,
      'refreshToken': refreshToken,
      'roles': roles,
      'token': token,
      'username': username,
    };
  }
}