import 'package:provider/provider.dart';
import 'package:prueba/providers/comics_favorite_providers.dart';
import 'package:flutter/material.dart';
import 'package:prueba/models/response_comics.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);
  
  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen>{
  @override
  Widget build(BuildContext context) {
    final comicInfo = ModalRoute.of(context)!.settings.arguments as Comic;

    final providerFavoritesComics =
        Provider.of<ComicsFavoritesProvider>(context);

  return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.black,
        title: 
        Image.network('https://i.pinimg.com/originals/06/59/ee/0659ee4a07929a77ea29da8b6d996754.jpg',
        width: 150,
        ),
        centerTitle: true,
      ),
    body: ListView(
      children: <Widget> [
        Image.network( comicInfo.getFullPoster(),
          height: 250,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child:Text(
              comicInfo.title,
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
        child: const Text(
          'By MARVEL',
          style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 255, 0, 0), letterSpacing: 0.5),
        ),
        ),
        
      Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Text(
                  comicInfo.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15.0),
                ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Column(children: <Widget> [
                
                  IconButton(
              onPressed: () {
                providerFavoritesComics.toggleFavorite(comicInfo);
              },
              icon: providerFavoritesComics.isExist(comicInfo)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
                const Text(
                  'Guardar como favorito',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
                ),
              ],)
            ],
          ),
        ),
      ],
    )
  );
    
  }
}