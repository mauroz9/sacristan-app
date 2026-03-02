import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantalla_login_ui/features/list_categories/bloc/list_categories_bloc.dart';
import 'package:pantalla_login_ui/features/list_categories/ui/widgets/category_card.dart';

class ListCategoriesView extends StatelessWidget {
  const ListCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCategoriesBloc, ListCategoriesState>(
      builder: (context, state) {
        if (state is ListCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ListCategoriesSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CategoryCard(
                  title: category.name,
                  count: category.sequenceCount,
                  isActive: false,
                ),
              );
            },
          );
        } else if (state is ListCategoriesError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No se han cargado las categorías'));
        }
      },
    );
  }

}