import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/shared/sequence_card.dart';

class SecuenciasHacerView extends StatelessWidget {
  const SecuenciasHacerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      
      child: Column(
        children: [
          Text(
            "Secuencias por hacer",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F3C8B),
              height: 0,
            ),
          ),
          SequenceCard()
        ],
      ),
    );
  }
}
