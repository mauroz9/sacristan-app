import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/teacher_response_model.dart';
import 'package:pantalla_login_ui/core/services/user_service.dart';


part 'teacher_info_event.dart';
part 'teacher_info_state.dart';

class TeacherInfoBloc extends Bloc<TeacherInfoEvent, TeacherInfoState> {
  TeacherInfoBloc(UserService userService) : super(TeacherInfoInitial()) {
    on<TeacherInfoRequested>((event, emit) async{
      emit(TeacherInfoLoading());

      try{
        final response = await userService.getTeacherInfo();
        
        emit(TeacherInfoSuccess(response: response));
      }on UserException catch (e){
        emit(TeacherInfoError(message: e.message));
      }catch(e){
        emit(TeacherInfoError(message: "Ocurrio un error inesperado: $e"));
      }
    });
  }
}
