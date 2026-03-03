import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pantalla_login_ui/core/models/library_category_response_model.dart';
import 'package:pantalla_login_ui/core/services/category_service.dart';

part 'list_categories_event.dart';
part 'list_categories_state.dart';

class ListCategoriesBloc extends Bloc<ListCategoriesEvent, ListCategoriesState> {
  final CategoryService categoryService;

  ListCategoriesBloc({required this.categoryService})
      : super(const ListCategoriesInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<SelectCategoryEvent>(_onSelectCategory);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<ListCategoriesState> emit,
  ) async {
    emit(const ListCategoriesLoading());

    try {
      final result = await categoryService.getCategories();
      emit(ListCategoriesSuccess(categories: result.content));
    } catch (e) {
      emit(ListCategoriesError(message: e.toString()));
    }
  }

  void _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<ListCategoriesState> emit,
  ) {
    final currentState = state;
    if (currentState is ListCategoriesSuccess) {
      emit(currentState.copyWith(
        selectedCategoryId: () => event.categoryId,
      ));
    }
  }
}
