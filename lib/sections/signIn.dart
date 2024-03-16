import 'package:authetication_sample/profile.dart';
import 'package:authetication_sample/sections/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class signIn_side extends StatelessWidget {
  signIn_side(this._flipController, {super.key});
  TextEditingController emailcontroller =
      TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  FlipCardController _flipController;

  signIn(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
      final User? user = userCredential.user;
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign in Successfully'),
          duration: Duration(seconds: 2),
        ));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No user found for that email'),
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong password provided for that user'),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('wrong Details'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
  

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.6,
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Stack(children: [
          Center(
            child: SizedBox(
              height: 550,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  const Text(
                    'Enter Login ID',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  text_field(
                    title: 'UserName',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    width: 300,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  text_field(
                    keyboardType: TextInputType.name,
                   
                    controller: passcontroller,
                    title: 'Password',
                    width: 300,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: 130,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {
                          signIn(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 234, 172, 0))),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 130,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {
                          _flipController.toggleCard();
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black26)),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ]));
  }
}
