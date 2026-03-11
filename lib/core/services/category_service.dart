import 'dart:convert';

import 'package:pantalla_login_ui/core/interfaces/category_interface.dart';
import 'package:pantalla_login_ui/core/models/library_category_response_model.dart';
import 'package:pantalla_login_ui/core/models/page_model.dart';
import 'package:http/http.dart' as http;
import 'package:pantalla_login_ui/core/others/exception_handler.dart';
import 'package:pantalla_login_ui/core/others/token_storage.dart';
import 'package:pantalla_login_ui/core/others/http_client_wrapper.dart';

class CategoryService implements ICategoryService {

    final String _baseUrl = TokenStorage.baseUrl;
    final _httpClient = HttpClientWrapper();

  
  @override
  Future<Page<LibraryCategoryResponseModel>> getCategories() async {
    final http.Response response;

    try {
      
      response = await _httpClient.get(Uri.parse("$_baseUrl/api/v1/student/categories"), headers: {
        "Content-Type": "application/json",
      });

      ExceptionHandler.handle(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
        return Page.fromJson(body, (item) => LibraryCategoryResponseModel.fromJson(item as Map<String, dynamic>));
      } else {
        throw Exception("Error desconocido al obtener las categorías.");
      }


    } catch (e) {
      rethrow;
    }

  }
  
}

