import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba/screens/home_screen.dart';
import 'package:prueba/screens/login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _sucess;
  late String _userEmail;

  void _register() async {
    final User? user = (
    await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
    ).user;

    if(user != null) {
      setState(() {
        _sucess = true;
        _userEmail = user.email!;
        print('Cuenta guardada');
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
      });
    } else {
      setState(() {
        _sucess = false;
        print('No se guardo la cuenta');
      });
    }
  }

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

      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "MARVEL COMICS",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 17, 0),
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
       const  Text(
          "Registrate para iniciar.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 44.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 10, right: 10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 255, 17, 0)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Contraseña (min 6 caracteres)',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 255, 17, 0)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )
                  ),
                  
                  obscureText: true,
                ),
                SizedBox(height: 5.0,),
                SizedBox(height: 40,),
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    color: Color.fromARGB(255, 255, 17, 0),
                    elevation: 7,
                    child: GestureDetector(
                        onTap: () async{
                          _register();
                        },
                        child: const Center(
                            child: Text(
                                'Registrate',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'
                                )
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    ));
  }
}