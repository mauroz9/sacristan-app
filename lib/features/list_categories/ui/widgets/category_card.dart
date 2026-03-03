import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
    {
      super.key,
      required this.title,
      required this.count,
      required this.isActive,
      this.onTap,
      }
    );

  final String title;
  final int count;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(isActive 
        ? Colors.white 
        : const Color.fromARGB(65, 255, 255, 255))
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive 
              ? Color(0xFF1F3C8B) 
              : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 6),
          Container(
            decoration: BoxDecoration(
              color: isActive 
                ? Color.fromARGB(51, 31, 60, 139) 
                : const Color.fromARGB(76, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
              child: Text(
                "$count",
                style: TextStyle(color: isActive ? Color(0xFF1F3C8B) : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
