import 'package:flutter/material.dart';

class SequenceCard extends StatelessWidget {
  const SequenceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(100), offset: Offset(0, 10), blurRadius: 10)]
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.watch_later_outlined, color: const Color(0xFF1F3C8B),),
                    Text("08:45", style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F3C8B) ,fontSize: 20),)
                  ],
                ),
                Container(
                  color: const Color.fromARGB(76, 33, 149, 243),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ahora", style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F3C8B), fontSize: 20),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}