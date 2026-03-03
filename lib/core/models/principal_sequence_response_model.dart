class PrincipalSequenceResponseModel {
  final int id;
  final String name;
  final String startTime;
  final int frontImageId;

  PrincipalSequenceResponseModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.frontImageId,
  });

  factory PrincipalSequenceResponseModel.fromJson(Map<String, dynamic> json) {
    return PrincipalSequenceResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      startTime: json['startTime'] as String,
      frontImageId: json['frontImageId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startTime': startTime,
      'frontImageId': frontImageId,
    };
  }

  PrincipalSequenceResponseModel copyWith({
    int? id,
    String? name,
    String? startTime,
    int? frontImageId,
  }) {
    return PrincipalSequenceResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      frontImageId: frontImageId ?? this.frontImageId,
    );
  }

  @override
  String toString() {
    return 'PrincipalSequenceResponseModel(id: $id, name: $name, startTime: $startTime, frontImageId: $frontImageId)';
  }
}
