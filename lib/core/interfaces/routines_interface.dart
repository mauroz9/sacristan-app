import 'package:pantalla_login_ui/core/models/page_model.dart';
import 'package:pantalla_login_ui/core/models/principal_sequence_response_model.dart';

abstract class IRoutinesService {
  Future<Page<PrincipalSequenceResponseModel>> getPendingSequences();
}