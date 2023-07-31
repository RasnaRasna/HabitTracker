import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/forget_password.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/login/signoption.dart';
import 'package:habits_track/onboarding/start.dart';

import 'countinue_google.dart';

// class SignPage extends StatefulWidget {
//   const SignPage({super.key});

//   @override
//   State<SignPage> createState() => _SignPageState();
// }

// class _SignPageState extends State<SignPage> {
//   bool passwordVisible = false;
//   TextEditingController _emailcontroller = TextEditingController();

//   TextEditingController _passwordcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image:
//                 AssetImage("images/waal.jpg"), // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("SIGN IN TO COUNTINUE",
//                 style: TextStyle(
//                   fontSize: 24,
//                 )),
//             kheight20,
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: reusableTextfield(
//                 "Enter Username",
//                 Icons.person,
//                 false,
//                 _emailcontroller,
//                 (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a username';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             kheight10,
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: reusableTextfield(
//                 "Enter password",
//                 Icons.lock_outline,
//                 true,
//                 _passwordcontroller,
//                 (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a username';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             // SizedBox(
//             //   height: 4,
//             // ),
//             forgetpassword(),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: FirebaseButton(context, "SIGN IN  ", () {
//                 FirebaseAuth.instance
//                     .signInWithEmailAndPassword(
//                         email: _emailcontroller.text,
//                         password: _passwordcontroller.text)
//                     .then((value) {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (ctx) => StartingPage()));
//                 }).onError((error, stackTrace) {
//                   print("password does not ${error.toString()}");
//                 });
//               }),
//             ),
//             signupOption(context), Text("OR"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   "images/google-removebg-preview.png",
//                   width: 40,
//                   height: 40,
//                 ),
//                 TextButton(
//                     onPressed: () async {
//                       showDialog(
//                         context: context,
//                         barrierDismissible:
//                             false, // Prevent dismissing the dialog by tapping outside
//                         builder: (BuildContext context) {
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         },
//                       );
//                       await FirebaseServices().signInWithGoogle();
//                       Navigator.pop(context);

//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (ctx) => StartingPage()));
//                     },
//                     child: Text("Countinue with Gmail"))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Row signupOption(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Don,t have an account ?",
//           style: TextStyle(color: Colors.black45),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignupScreen()));
//           },
//           child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               )),
//         )
//       ],
//     );
//   }

//   Widget forgetpassword() {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: 35,
//         alignment: Alignment.bottomRight,
//         child: TextButton(
//             onPressed: () => Navigator.push(
//                 context, MaterialPageRoute(builder: (ctx) => ResetPassword())),
//             child: Text(
//               "Forgot password?",
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.right,
//             )));
//   }
// }

// class SignPage extends StatefulWidget {
//   const SignPage({Key? key});

//   @override
//   State<SignPage> createState() => _SignPageState();
// }

// class _SignPageState extends State<SignPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool passwordVisible = false;
//   TextEditingController _emailcontroller = TextEditingController();
//   TextEditingController _passwordcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image:
//                 AssetImage("images/waal.jpg"), // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "SIGN IN TO CONTINUE",
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               ),
//               kheight20,
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: reusableTextfield(
//                   "Enter Username",
//                   Icons.person,
//                   false,
//                   _emailcontroller,
//                   (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a username';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               kheight10,
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: reusableTextfield(
//                   "Enter password",
//                   Icons.lock_outline,
//                   true,
//                   _passwordcontroller,
//                   (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               forgetpassword(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: FirebaseButton(
//                   context,
//                   "SIGN IN",
//                   () {
//                     if (_formKey.currentState!.validate()) {
//                       FirebaseAuth.instance
//                           .signInWithEmailAndPassword(
//                         email: _emailcontroller.text,
//                         password: _passwordcontroller.text,
//                       )
//                           .then((value) {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (ctx) => StartingPage(),
//                           ),
//                         );
//                       }).catchError((error) {
//                         print("Password does not match: ${error.toString()}");
//                       });
//                     }
//                   },
//                 ),
//               ),
//               signupOption(context),
//               Text("OR"),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "images/google-removebg-preview.png",
//                     width: 40,
//                     height: 40,
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       showDialog(
//                         context: context,
//                         barrierDismissible: false,
//                         builder: (BuildContext context) {
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         },
//                       );
//                       await FirebaseServices().signInWithGoogle();
//                       Navigator.pop(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (ctx) => StartingPage(),
//                         ),
//                       );
//                     },
//                     child: Text("Continue with Gmail"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row signupOption(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Don't have an account? ",
//           style: TextStyle(color: Colors.black45),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SignupScreen()),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Text(
//               "Sign Up",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget forgetpassword() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 35,
//       alignment: Alignment.bottomRight,
//       child: TextButton(
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (ctx) => ResetPassword()),
//         ),
//         child: Text(
//           "Forgot password?",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//           textAlign: TextAlign.right,
//         ),
//       ),
//     );
//   }
// }
// }

class SignPage extends StatefulWidget {
  const SignPage({Key? key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool isSigningIn = false;
  // Track the sign-in process
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/download.jpeg"),
            // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN IN TO CONTINUE",
                style: GoogleFonts.acme(fontSize: 24, color: kwhite),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.all(20),
                child: reusableTextfield(
                  "Enter Username",
                  Icons.person,
                  false,
                  _emailcontroller,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: reusableTextfield(
                  "Enter password",
                  Icons.lock_outline,
                  true,
                  _passwordcontroller,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              forgetpassword(context),
              Padding(
                padding: const EdgeInsets.all(25),
                child:
                    isSigningIn // Display CircularProgressIndicator when signing in
                        ? const CircularProgressIndicator()
                        : FirebaseButton(
                            context,
                            "SIGN IN",
                            () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isSigningIn = true;
                                });

                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text,
                                )
                                    .then((value) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => const StartingPage(),
                                    ),
                                  );
                                }).catchError((error) {
                                  if (error.code == 'wrong-password') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Wrong Password',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          content: const Text(
                                            'The password you entered is incorrect.',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    print(
                                        "Error occurred: ${error.toString()}");
                                  }
                                }).whenComplete(() {
                                  setState(() {
                                    isSigningIn = false;
                                  });
                                });

                                // FirebaseAuth.instance
                                //     .signInWithEmailAndPassword(
                                //   email: _emailcontroller.text,
                                //   password: _passwordcontroller.text,
                                // )
                                //     .then((value) {
                                //   Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //       builder: (ctx) => StartingPage(),
                                //     ),
                                //   );
                                // }).catchError((error) {
                                //   print(
                                //       "Password does not match: ${error.toString()}");
                                // }).whenComplete(() {
                                //   setState(() {
                                //     isSigningIn = false;
                                //   });
                                // });
                              }
                            },
                          ),
              ),
              signupOption(context),
              const Text(
                "OR",
                style: TextStyle(color: kwhite),
              ),
              continueWithGoogle(context),
            ],
          ),
        ),
      ),
    );
  }
}
