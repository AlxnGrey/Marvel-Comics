import 'package:prueba/screens/detail_comic.dart';
import '/models/response_comics.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatelessWidget {
  final Comic comic;

  const ItemComic({
    Key? key,
    required this.comic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: SizedBox(
          width: 70.0,
          child: Image(
            image: NetworkImage(
              comic.getFullPoster(),
            ),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(comic.title),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 255, 17, 0),),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const DetailScreen())),
      ),
    );
  }
}
