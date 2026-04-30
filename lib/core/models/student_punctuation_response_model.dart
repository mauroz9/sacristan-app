class StudentPunctuationResponseModel {

  final int completadas;
  final int activas;
  final int diasRacha;



  StudentPunctuationResponseModel({
    required this.completadas,
    required this.activas,
    required this.diasRacha,
  });

  static Future<StudentPunctuationResponseModel> fromJson(Map<String, dynamic> body) async {
    return StudentPunctuationResponseModel(
      completadas: body['completadas'] as int,
      activas: body['activas'] as int,
      diasRacha: body['dias_racha'] as int,
    );
  }


}