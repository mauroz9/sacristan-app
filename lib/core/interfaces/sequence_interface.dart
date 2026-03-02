import 'package:pantalla_login_ui/core/models/library_sequence_response_model.dart';
import 'package:pantalla_login_ui/core/models/page_model.dart';

abstract class ISequenceService {

  Future<Page<LibrarySequenceResponseModel>> getSequences();

}