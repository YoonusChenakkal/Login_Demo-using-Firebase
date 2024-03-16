import 'package:authetication_sample/profile.dart';
import 'package:authetication_sample/sections/animated_signUp/signUp_Full.dart';
import 'package:authetication_sample/sections/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class signUp_side extends StatelessWidget {
  signUp_side(this._flipCardController, {super.key});

  FlipCardController _flipCardController;

  bool selected = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  signUp(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      final User? user = userCredential.user;
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.6,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Center(
        child: SizedBox(
          height: 550,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              const Text(
                'Register Details',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text_field(
                    data: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    controller: namecontroller,
                    title: 'FIrst Name',
                    width: 130,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  text_field(
                    data: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    title: 'Email',
                    width: 200,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              text_field(
                data: (value) {},
                keyboardType: TextInputType.name,
                controller: passwordcontroller,
                title: 'Password',
                width: 345,
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
                      signUp(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black26)),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    indent: 80,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    endIndent: 80,
                  )),
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
                      _flipCardController.toggleCard();
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 234, 172, 0))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
