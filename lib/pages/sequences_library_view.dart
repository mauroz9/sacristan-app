import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/features/library_sequences/ui/library_sequences_view.dart';
import 'package:pantalla_login_ui/features/list_categories/ui/list_categories_view.dart';
import 'package:pantalla_login_ui/features/list_categories/ui/widgets/category_card.dart';

class SequencesLibrary extends StatelessWidget {
  const SequencesLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 225,
          decoration: BoxDecoration(
            color: const Color(0xFF1F3C8B),
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(
                width: 7,
                color: const Color.fromARGB(255, 240, 200, 56),
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Biblioteca de secuencias",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Buscar secuencias...",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(150, 255, 255, 255),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color.fromARGB(150, 255, 255, 255),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(26, 255, 255, 255),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromARGB(50, 255, 255, 255)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromARGB(50, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListCategoriesView(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: LibrarySequencesView(),
        )
      ],
    );
  }
}
