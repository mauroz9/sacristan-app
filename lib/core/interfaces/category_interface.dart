import 'package:pantalla_login_ui/core/models/library_category_response_model.dart';
import 'package:pantalla_login_ui/core/models/page_model.dart';

abstract class ICategoryService {

  Future<Page<LibraryCategoryResponseModel>> getCategories();

}