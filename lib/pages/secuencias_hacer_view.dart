import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/shared/sequence_card.dart';

class SecuenciasHacerView extends StatelessWidget {
  const SecuenciasHacerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Secuencias por hacer",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F3C8B),
                  height: 0,
                ),
              ),
            ),
            Expanded(
            flex: 8, 
            child: Center(
              child: SizedBox(
                height: 450,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SequenceCard(title: "Lavado de manos", time: "08:45", idImagen: "8975"),
                    SizedBox(width: 20),
                    SequenceCard(title: "Lavado de manos", time: "08:45", idImagen: "8975"),
                    SizedBox(width: 20),
                    SequenceCard(title: "Lavado de manos", time: "08:45", idImagen: "8975"),
                    SizedBox(width: 20),
                    SequenceCard(title: "Lavado de manos", time: "08:45", idImagen: "8975"),
                  ],
                ),
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
