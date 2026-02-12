import 'package:flutter/material.dart';

class TeacherInfo extends StatefulWidget {
  const TeacherInfo({super.key});

  @override
  State<TeacherInfo> createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          spacing: 5,
          children: [
            Icon(
              Icons.person_4_outlined,
              size: 35,
              color: const Color(0xFF1F3C8B),
            ),
            Text(
              "Mi Profesor",
              style: TextStyle(
                fontSize: 22,
                color: const Color(0xFF1F3C8B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF4C63A2),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Image(
                    image: NetworkImage(
                      "https://images.icon-icons.com/2483/PNG/512/user_icon_149851.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        "Nombre del profe",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.mail_outline_outlined,
                            size: 16,
                            color: const Color(0xFF4A5565),
                          ),
                          Expanded(
                            child: Text(
                              "correodelprofe@gmail.com",
                              style: TextStyle(
                                color: const Color(0xFF4A5565),
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
