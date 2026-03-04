class PrincipalSequenceResponseModel {
  final int id;
  final String name;
  final String startTime;
  final int frontImageId;
  final int routineSequenceId;

  PrincipalSequenceResponseModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.frontImageId,
    required this.routineSequenceId,
  });

  factory PrincipalSequenceResponseModel.fromJson(Map<String, dynamic> json) {
    return PrincipalSequenceResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      startTime: json['startTime'] as String,
      frontImageId: json['frontImageId'] as int,
      routineSequenceId: json['routineSequenceId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startTime': startTime,
      'frontImageId': frontImageId,
      'routineSequenceId': routineSequenceId,
    };
  }

  PrincipalSequenceResponseModel copyWith({
    int? id,
    String? name,
    String? startTime,
    int? frontImageId,
    int? routineSequenceId,
  }) {
    return PrincipalSequenceResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      frontImageId: frontImageId ?? this.frontImageId,
      routineSequenceId: routineSequenceId ?? this.routineSequenceId,
    );
  }

  @override
  String toString() {
    return 'PrincipalSequenceResponseModel(id: $id, name: $name, startTime: $startTime, frontImageId: $frontImageId, routineSequenceId: $routineSequenceId)';
  }
}
