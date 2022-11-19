import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:prueba/models/response_comics.dart';

class ComicsFavoritesProvider extends ChangeNotifier {
  List<Comic> _listFavoriteComics = [];

  List<Comic> get listFavoriteList => _listFavoriteComics;

  void toggleFavorite(Comic comic) {
    final isExist = _listFavoriteComics.contains(comic);
      if (isExist) {
      _listFavoriteComics.remove(comic);
    } else {
      _listFavoriteComics.add(comic);
    }
    notifyListeners();
  }

    bool isExist(Comic comic) {
    final isExist = _listFavoriteComics.contains(comic);
    return isExist;
  }

  void clearFavorite() {
    _listFavoriteComics = [];
    notifyListeners();
  }

  static ComicsFavoritesProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<ComicsFavoritesProvider>(
      context,
      listen: listen,
    );
  }
  
}