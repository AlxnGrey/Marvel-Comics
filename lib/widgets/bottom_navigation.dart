import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({Key? key, required this.currentIndex}) : super(key: key);
  
  @override
  _BNavigatorState createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index= 0;

  @override
  Widget build(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: index,
    onTap: (int i){
      setState(() {
      index = i;
      widget.currentIndex(i);  
      });
    },
    selectedItemColor: Color.fromARGB(255, 255, 17, 0),
    iconSize: 25.0,
    selectedFontSize: 14.0,
    unselectedFontSize: 12.0,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Comics'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ],
  );
  }

}