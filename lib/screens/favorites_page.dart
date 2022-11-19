import 'package:prueba/providers/comics_favorite_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/response_comics.dart';

class FavoritesComicsPage extends StatelessWidget {
  const FavoritesComicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesComics = Provider.of<ComicsFavoritesProvider>(context);

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
      
      body: favoritesComics.listFavoriteList.isNotEmpty
          ? Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Lista de favoritos.',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: favoritesComics.listFavoriteList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 23),
                        child: ListTile(
                          leading: Image(
                              image: NetworkImage(favoritesComics
                                  .listFavoriteList[index]
                                  .getFullPoster())),
                          title: Text(
                              favoritesComics.listFavoriteList[index].title),
                              trailing: IconButton(
                              onPressed: () {},
                              icon: 
                              const Icon(Icons.favorite, color: Colors.red)  
            ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                child: MaterialButton(
                onPressed: (){
                  providerFavoritesComics.clearFavorite();
          },
          color: Color.fromARGB(255, 255, 0, 0),
          child: Text('Borrar favoritos.'),
        ),
      ),
              ],
              
            )
          : Center(
              child: Text(
                'No tienes comics favoritos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
