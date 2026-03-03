import 'package:pantalla_login_ui/core/models/student_response_model.dart';
import 'package:pantalla_login_ui/core/models/teacher_response_model.dart';

abstract class IUserService {
  Future<StudentResponseModel> getUserInfo();
  Future<TeacherResponseModel> getTeacherInfo();
}