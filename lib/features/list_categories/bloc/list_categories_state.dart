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

  const ListCategoriesSuccess({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class ListCategoriesError extends ListCategoriesState {
  final String message;

  const ListCategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
