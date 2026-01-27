import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/pages/secuencias_hacer_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SecuenciasHacerView(),
    const Center(child: Text("Biblioteca")),
    const Center(child: Text("Perfil")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 238, 242, 255)],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Hoy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "Biblioteca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
