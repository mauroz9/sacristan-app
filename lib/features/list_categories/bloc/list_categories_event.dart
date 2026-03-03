part of 'list_categories_bloc.dart';

abstract class ListCategoriesEvent extends Equatable {
  const ListCategoriesEvent();

  @override
  List<Object?> get props => [];
}

class FetchCategoriesEvent extends ListCategoriesEvent {
  const FetchCategoriesEvent();
}

class SelectCategoryEvent extends ListCategoriesEvent {
  final int? categoryId;

  const SelectCategoryEvent({this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
