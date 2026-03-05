import 'package:flutter/material.dart';
import 'package:pantalla_login_ui/pages/profile_view.dart';
import 'package:pantalla_login_ui/pages/sequences_library_view.dart';
import 'package:pantalla_login_ui/pages/sequences_to_do_view.dart';
import 'package:pantalla_login_ui/shared/custom_bottom_navigation_bar_item.dart';

class MainView extends StatefulWidget {
  final int initialIndex; // Add this line
  const MainView({super.key, this.initialIndex = 0}); // Default to 0
  
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  
  late int _selectedIndex; // Change to late
  
  final List<Widget> _pages = [
    const SecuenciasHacerView(),
    const SequencesLibrary(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

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
      bottomNavigationBar: SizedBox(
        height: 110,
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
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
      ),
    );
  }
}
