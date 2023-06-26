// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:habits_track/bottom_pages/Home_page.dart';
// import 'package:habits_track/bottom_pages/bottom_bar.dart';
// import 'package:habits_track/const.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:habits_track/onboarding/onboardingpage.dart';
// import 'package:habits_track/onboarding/start.dart';

// class Signup extends StatelessWidget {
//   const Signup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 40),
//                     child: Container(
//                       width: 300,
//                       height: 320,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                               color: Color.fromARGB(255, 209, 207, 207))),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: Text(
//                               "Habit Tracker",
//                               style: GoogleFonts.acme(fontSize: 20),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Container(
//                                 height: 40,
//                                 width: 250,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Color.fromARGB(
//                                             255, 209, 207, 207))),
//                                 child: TextField(
//                                   textAlign: TextAlign.center,
//                                   decoration: InputDecoration(
//                                       hintText: "Phone number ,or email",
//                                       hintStyle: TextStyle(fontSize: 14),
//                                       border: InputBorder.none),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Container(
//                                 height: 40,
//                                 width: 250,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Color.fromARGB(
//                                             255, 209, 207, 207))),
//                                 child: TextField(
//                                   textAlign: TextAlign.center,
//                                   decoration: InputDecoration(
//                                       hintText: "Password",
//                                       hintStyle: TextStyle(fontSize: 14),
//                                       border: InputBorder.none),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Container(
//                                 height: 40,
//                                 width: 250,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Color.fromARGB(
//                                             255, 209, 207, 207))),
//                                 child: TextField(
//                                   textAlign: TextAlign.center,
//                                   decoration: InputDecoration(
//                                       hintText: " Confiming Password",
//                                       hintStyle: TextStyle(fontSize: 14),
//                                       border: InputBorder.none),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (ctx) => StartingPage()));
//                               },
//                               child: Container(
//                                 height: 23,
//                                 width: 200,
//                                 decoration: BoxDecoration(
//                                     color: Colors.pink.shade100,
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         color: Color.fromARGB(
//                                             255, 170, 167, 167))),
//                                 child: Align(
//                                     alignment: Alignment.center,
//                                     child: Text("Sign up")),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 40,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: Color.fromARGB(255, 209, 207, 207),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (ctx) => OnboardingPage()));
//                         },
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             text: " have an account? ",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: "Log in",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 // Add any onTap or other properties as needed
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
