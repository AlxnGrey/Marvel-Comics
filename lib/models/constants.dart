import 'package:flutter/material.dart';

class Constants {
  static List<String> listComicsFake =
      List.generate(10, (int index) => 'Comic numero $index');

//Lista de colores para simular la imagen
  static const List<Color> colors = [
    Colors.redAccent,
    Colors.teal,
    Colors.green,
    Colors.grey,
    Colors.purple,
    Colors.yellow,
    Colors.indigo
  ];
}