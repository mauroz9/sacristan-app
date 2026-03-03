part of 'list_categories_bloc.dart';

abstract class ListCategoriesState extends Equatable {
  const ListCategoriesState();

  @override
  List<Object?> get props => [];
}

class ListCategoriesInitial extends ListCategoriesState {
  const ListCategoriesInitial();
}

class ListCategoriesLoading extends ListCategoriesState {
  const ListCategoriesLoading();
}

class ListCategoriesSuccess extends ListCategoriesState {
  final List<LibraryCategoryResponseModel> categories;
  final int? selectedCategoryId;

  const ListCategoriesSuccess({
    required this.categories,
    this.selectedCategoryId,
  });

  ListCategoriesSuccess copyWith({
    List<LibraryCategoryResponseModel>? categories,
    int? Function()? selectedCategoryId,
  }) {
    return ListCategoriesSuccess(
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategoryId != null
          ? selectedCategoryId()
          : this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props => [categories, selectedCategoryId];
}

class ListCategoriesError extends ListCategoriesState {
  final String message;

  const ListCategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
