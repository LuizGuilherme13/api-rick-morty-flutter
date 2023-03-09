import 'package:bottom_navigation/screens/character_screen.dart';
import 'package:bottom_navigation/screens/new_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: const HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const NewPageScreen(title: "Localidades"),
    const CharacterScreen(),
    const NewPageScreen(title: "Episódios"),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick & Morty API')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_outlined),
              label: "Localidades"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Personagens",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: "Episódios",
          ),
        ],
      ),
    );
  }
}
