import 'package:flutter/material.dart';
import 'package:prueba/models/response_comics.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);
  
  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen>{
 // late final Comic comic;

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
    body: Container(
      
  //  child: Image(
  //          image: NetworkImage(
  //            comic.getFullPoster(),
  //          ),)
      
  ));
  }
}