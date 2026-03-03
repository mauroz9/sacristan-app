import 'package:pantalla_login_ui/core/models/step_response_model.dart';

class SequenceResponseModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final List<StepResponseModel> steps;

  SequenceResponseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.steps,
  });

  factory SequenceResponseModel.fromJson(Map<String, dynamic> json) {
    return SequenceResponseModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      steps: (json['steps'] as List)
          .map((step) => StepResponseModel.fromJson(step as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }
}
