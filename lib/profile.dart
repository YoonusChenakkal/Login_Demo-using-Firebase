import 'package:authetication_sample/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => loginScreen(),),(route) => false,);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      // color: Colors.black,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: OvalBorder(),
                              ),
                              width: 110,
                              height: 110,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 80,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                    0xFF5686E1), // Set the background color
                              ),
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Positioned(
                            bottom: -9.5,
                            right: -9.3,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Yoonus',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                     'yoonusyzyoons@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 125,
                      child: ElevatedButton(
                        onPressed: () {
                          signOut(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            backgroundColor:
                                MaterialStatePropertyAll(Color((0xFF5686E1)))),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            )));
  }
}
