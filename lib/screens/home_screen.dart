import 'package:flutter/material.dart';
import 'package:prueba/widgets/bottom_navigation.dart';
import 'package:prueba/widgets/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  int index = 0;
  BNavigator ?myBNB;

  @override
  void initState() {

    myBNB = BNavigator(currentIndex: (i){
  setState(() {
    index = i;
});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    bottomNavigationBar: myBNB,
    body: Routes(index: index),
  );
  
  }}