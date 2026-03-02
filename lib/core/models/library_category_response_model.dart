class LibraryCategoryResponseModel {
  final int id;
  final String name;
  final int sequenceCount;

  LibraryCategoryResponseModel({
    required this.id,
    required this.name,
    required this.sequenceCount,
  });

  factory LibraryCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return LibraryCategoryResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      sequenceCount: json['sequenceCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sequenceCount': sequenceCount,
    };
  }

  LibraryCategoryResponseModel copyWith({
    int? id,
    String? name,
    int? sequenceCount,
  }) {
    return LibraryCategoryResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sequenceCount: sequenceCount ?? this.sequenceCount,
    );
  }

  @override
  String toString() =>
      'LibraryCategoryResponseModel(id: $id, name: $name, sequenceCount: $sequenceCount)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryCategoryResponseModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          sequenceCount == other.sequenceCount;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ sequenceCount.hashCode;
}
