import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SizedBox()),
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF4C63A2), width: 5),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Image(
                  image: NetworkImage(
                    "https://images.icon-icons.com/2483/PNG/512/user_icon_149851.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "Nombre del alumno",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F3C8B),
                    padding: EdgeInsets
                        .zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  child: Icon(Icons.logout_rounded, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
