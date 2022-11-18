import 'package:flutter/material.dart';
import 'package:prueba/screens/detail_comic.dart';
import 'package:prueba/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:prueba/providers/comics_favorite_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ComicsFavoritesProvider(),
        )
      ],
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home':(_) => const HomeScreen(),
      'detail':(_) => const DetailScreen(),
    },
  )
  );
}
}