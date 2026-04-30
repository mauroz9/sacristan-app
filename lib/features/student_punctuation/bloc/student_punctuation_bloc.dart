import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pantalla_login_ui/core/models/student_punctuation_response_model.dart';
import 'package:pantalla_login_ui/core/services/user_service.dart';

part 'student_punctuation_event.dart';
part 'student_punctuation_state.dart';

class StudentPunctuationBloc extends Bloc<StudentPunctuationEvent, StudentPunctuationState> {
  StudentPunctuationBloc(UserService userService) : super(StudentPunctuationInitial()) {
    on<StudentPunctuationRequested>((event, emit) async {
      emit(StudentPunctuationLoading());

      try {
        final response = await userService.getUserPunctuation();

        emit(StudentPunctuationSuccess(response: response));
      } on UserException catch (e) {
        emit(StudentPunctuationError(message: e.message));
      } catch (e) {
        emit(StudentPunctuationError(message: "Ocurrio un error inesperado: $e"));
      }
    });
  }
}
