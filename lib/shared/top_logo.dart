import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: SvgPicture.asset("assets/images/sacristan_logo.svg", height: 150,),
          ),
          Text("Acceso Alumno", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(31, 60, 139, 1.0)),),
          Text("Instituto Dr. Sacristán", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 94, 94, 94)),)
        ],
      ),
    );
  }
}
