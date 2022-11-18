import 'package:prueba/models/response_comics.dart';
import 'package:flutter/foundation.dart';

class ComicsFavoritesProvider extends ChangeNotifier {
  List<Comic> _listFavoriteComics = [];

  List<Comic> get listFavoriteList => _listFavoriteComics;

  void addComic(Comic comic) {
    _listFavoriteComics.add(comic);
    notifyListeners();
  }
}