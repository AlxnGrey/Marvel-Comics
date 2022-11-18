import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba/screens/home_page.dart';
import 'package:prueba/screens/home_screen.dart';
import 'package:prueba/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen( {Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  //Login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user= userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }
 
  @override
  Widget build(BuildContext context) {
    //textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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

SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // CONTENT HERE
    
    Padding(
    padding: const EdgeInsets.all(16.0),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 90.0,
        ),
        const Text(
          "MARVEL COMICS",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 17, 0),
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
       const  Text(
          "Inicia sesión para ingresar.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 44.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Correo',
                labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 160, 160, 160)
          ),
          prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 255, 17, 0)))
        ),
        const SizedBox(
          height: 26.0,
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
                  labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 160, 160, 160)
           
          ),
           prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 255, 17, 0)))
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "¿No tienes cuenta? Click aqui.",
          style: TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage())),
      ),
    ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: double.infinity,
          child: RawMaterialButton(
            fillColor: const Color.fromARGB(255, 255, 17, 0),
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
            onPressed: () async {
              User? user= await loginUsingEmailPassword(email: _emailController.text , password: _passwordController.text, context: context);
              print(user);
              if(user != null){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
              }
              else{
                print('Usuario no encontrado');
              }
            },
            child: const Text("Iniciar sesión",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'
            )),
          ),
        ),
      ],
    ),
    )
            ]
          ),
        ),
      ),
    ),

    );
  }
}

