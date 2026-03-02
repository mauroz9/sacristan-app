import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/list_categories/ui/widgets/category_card.dart';

class ListCategoriesView extends StatefulWidget {
  const ListCategoriesView({super.key});

  @override
  State<ListCategoriesView> createState() => _ListCategoriesViewState();
}

class _ListCategoriesViewState extends State<ListCategoriesView> {

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Misa Dominical',
      'count': 12,
      'isActive': true,
    }
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CategoryCard(
            title: category['title'],
            count: category['count'],
            isActive: category['isActive'] ?? false,
          ),
        );
      },
    );
  }

}