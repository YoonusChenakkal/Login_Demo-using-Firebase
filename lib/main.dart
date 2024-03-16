
import 'package:authetication_sample/firebase_options.dart';
import 'package:authetication_sample/profile.dart';
import 'package:authetication_sample/sections/signIn.dart';
import 'package:authetication_sample/sections/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return MaterialApp(
  home:user!=null ?Profile():loginScreen(),

   );
  }
}

class loginScreen extends StatelessWidget {
  loginScreen({super.key});
  FlipCardController _flipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            child: Image.asset(
              'assets/LoginProject.jpg',
              fit: BoxFit.cover,
            ),
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
            bottom: 0,
            child: FlipCard(
              flipOnTouch: false,
              controller: _flipController,
              front: signIn_side(_flipController),
              back: signUp_side(_flipController),
            ))
      ]),
    );
  }
}
