
// import 'package:authetication_sample/profile.dart';
// import 'package:authetication_sample/sections/text_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flip_card/flip_card_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class signUp_Full extends StatelessWidget {
//   signUp_Full(this._flipController, {super.key});
//   FlipCardController _flipController;

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailcontroller =
//         TextEditingController(text: '');

//     TextEditingController passcontroller =
//         TextEditingController(text: '');
//     TextEditingController namecontroller = TextEditingController();
//     

//     return Container(
//       color: Colors.teal,
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 120),
//           const Text(
//             'Register Details',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontFamily: 'Roboto',
//               fontWeight: FontWeight.w600,
//               height: 0,
//             ),
//           ),
//           const SizedBox(
//             height: 70,
//           ),
//           text_field(
//             data: (value) {
//               return SizedBox();
//             },
//             // controller: namecontroller,
//             keyboardType: TextInputType.name,
//             title: 'Name',
//             width: 300,
//             color: Colors.white,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           text_field(
//             data: (value) {
//              return SizedBox();
//             },
//             keyboardType: TextInputType.emailAddress,
//             // controller: emailcontroller,
//             title: 'Email',
//             width: 300,
//             color: Colors.white,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           text_field(
//             data: (value) {
//              return SizedBox();
//             },
//             keyboardType: TextInputType.none,
//             // controller: passcontroller,
//             title: 'Enter Password',
//             width: 300,
//             color: Colors.white,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           text_field(
//             data: (value) {
//              return SizedBox();
//             },
//             keyboardType: TextInputType.none,
//             title: 'Re-Enter Password',
//             width: 300,
//             color: Colors.white,
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           SizedBox(
//               width: 130,
//               height: 34,
//               child: ElevatedButton(
//                 onPressed: () {
//                  
//                 },
//                 style: ButtonStyle(
//                     shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6))),
//                     backgroundColor: MaterialStatePropertyAll(
//                       Color.fromARGB(255, 234, 172, 0),
//                     )),
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//               width: 130,
//               height: 34,
//               child: ElevatedButton(
//                 onPressed: () {
                
//                 },
//                 style: ButtonStyle(
//                     shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6))),
//                     backgroundColor: MaterialStatePropertyAll(
//                       Colors.black26,
//                     )),
//                 child: const Text(
//                   'Back',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
