import 'package:flutter/material.dart';

class SequenceCard extends StatelessWidget {
  const SequenceCard(
    {
      super.key,
      required this.title,
      required this.time,
      required this.idImagen
      }
    );

  final String title;
  final String time;
  final String idImagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
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
                    Icon(
                      Icons.watch_later_outlined,
                      color: const Color(0xFF1F3C8B),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F3C8B),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ahora",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F3C8B),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Image.network(
                "https://api.arasaac.org/v1/pictograms/$idImagen",
                fit: BoxFit.contain, // Ajusta la imagen sin deformarla
              ),
            ),            
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F3C8B),
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF1F3C8B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Iniciar ahora",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
