class StepResponseModel {
  final int id;
  final String name;
  final int position;
  final int arasaacPictogramId;

  StepResponseModel({
    required this.id,
    required this.name,
    required this.position,
    required this.arasaacPictogramId,
  });

  factory StepResponseModel.fromJson(Map<String, dynamic> json) {
    return StepResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      position: json['position'] as int,
      arasaacPictogramId: json['arasaacPictogramId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'arasaacPictogramId': arasaacPictogramId,
    };
  }
}