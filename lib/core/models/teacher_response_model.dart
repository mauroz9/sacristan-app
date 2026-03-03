class TeacherResponseModel {
  final int id;
  final String username;
  final String email;
  final String name;
  final String lastName;

  TeacherResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.lastName,
  });

  factory TeacherResponseModel.fromJson(Map<String, dynamic> json) {
    return TeacherResponseModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'lastName': lastName,
    };
  }
}