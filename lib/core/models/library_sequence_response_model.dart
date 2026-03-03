class LibrarySequenceResponseModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final int steps;

  LibrarySequenceResponseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.steps,
  });

  factory LibrarySequenceResponseModel.fromJson(Map<String, dynamic> json) {
    return LibrarySequenceResponseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      steps: json['steps'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'steps': steps,
    };
  }

  LibrarySequenceResponseModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    int? steps,
  }) {
    return LibrarySequenceResponseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      steps: steps ?? this.steps,
    );
  }

  @override
  String toString() =>
      'LibrarySequenceResponseModel(id: $id, title: $title, description: $description, category: $category, steps: $steps)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibrarySequenceResponseModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          category == other.category &&
          steps == other.steps;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      steps.hashCode;
}
