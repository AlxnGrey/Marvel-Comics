import 'package:flutter/material.dart';
import 'package:prueba/screens/comics_screen.dart';
import 'package:prueba/screens/favorites_page.dart';
import 'package:prueba/screens/settings_screen.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes ({Key? key, required this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ComicsScreen(),
      const SettingsScreen(),
      const FavoritesComicsPage(),
    ];
    return myList[index];
  }

}