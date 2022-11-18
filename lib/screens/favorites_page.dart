import 'package:prueba/providers/comics_favorite_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesComicsPage extends StatelessWidget {
  const FavoritesComicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesComics = Provider.of<ComicsFavoritesProvider>(context);

    return Scaffold(
      body: favoritesComics.listFavoriteList.isNotEmpty
          ? Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Lista de favoritos',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
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
                        ),
                      );
                    },
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
