import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem(
    {
      super.key,
      required this.active,
      required this.icon,
      required this.label,

      }
      );

  final bool active;
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: active ? Color(0xFFE3E9F8) : Colors.transparent,
                ),
                child: (
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(icon.icon,  color: Color(0xFF1F3C8B), size: 30,),
                    Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1F3C8B), fontSize: 15))
                  ],)
                ),
              ),
            );
  }
}