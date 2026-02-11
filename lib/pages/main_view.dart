import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/pages/sequences_library.dart';
import 'package:pantalla_login_ui/pages/sequences_to_do_view.dart';
import 'package:pantalla_login_ui/shared/custom_bottom_navigation_bar_item.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SecuenciasHacerView(),
    const SequencesLibrary(),
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
            colors: [
              Color.fromARGB(255, 238, 246, 255),
              Color.fromARGB(255, 238, 242, 255),
            ],
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
        selectedItemColor: Color(0xFF1F3C8B),

        items: [
          BottomNavigationBarItem(
            activeIcon: CustomBottomNavigationBarItem(active: true, icon: Icon(Icons.home_outlined),label: 'Hoy'),
            icon: CustomBottomNavigationBarItem(active: false, icon: Icon(Icons.home_outlined),label: 'Hoy'),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: CustomBottomNavigationBarItem(active: true, icon: Icon(Icons.local_library_outlined),label: 'Biblioteca'),
            icon: CustomBottomNavigationBarItem(active: false, icon: Icon(Icons.local_library_outlined),label: 'Biblioteca'),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: CustomBottomNavigationBarItem(active: true, icon: Icon(Icons.person_outline_rounded),label: 'Perfil'),
            icon: CustomBottomNavigationBarItem(active: false, icon: Icon(Icons.person_outline_rounded),label: 'Perfil'),
            label: ''
          ),
        ],
      ),
    );
  }
}
