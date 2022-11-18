import '/api/comics_api.dart';
import '/models/constants.dart';
import '/models/response_comics.dart';
import '/widgets/item_comic.dart';
import 'package:flutter/material.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({ Key? key }) : super(key: key);
  
  @override
  _ComicsScreen createState() => _ComicsScreen();
}

class _ComicsScreen extends State<ComicsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        title: 
        Image.network('https://i.pinimg.com/originals/06/59/ee/0659ee4a07929a77ea29da8b6d996754.jpg',
        width: 150,
        ),
        centerTitle: true,
      ),
        body:
        FutureBuilder<List<Comic>>(
          future: apiComics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Comics disponibles:',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: Constants.listComicsFake.length,
                      itemBuilder: (context, index) {
                        final comic = snapshot.data![index];
                        return ItemComic(
                          comic: comic,
                        );
                      },
                    ),
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),

        );
  }
}