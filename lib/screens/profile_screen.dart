import '/api/comics_api.dart';
import '/models/constants.dart';
import '/models/response_comics.dart';
import '/widgets/item_comic.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);
  
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          title: const Text('Comics de Marvel'),
        ),
        body: FutureBuilder<List<Comic>>(
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
                  const Text(
                    'Mis comics',
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
        ));
  }
}