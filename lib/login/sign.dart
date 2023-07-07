import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/firebase_services.dart';
import 'package:habits_track/login/resetpassword.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/login/signup.dart';
import 'package:habits_track/onboarding/start.dart';

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
class SignPage extends StatefulWidget {
  const SignPage({Key? key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool isSigningIn = false; // Track the sign-in process
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    // Add your custom password validation logic here
    if (value != 'your_predefined_password') {
      return 'Incorrect password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("images/waal.jpg"), // Replace with your image path
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
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              kheight10,
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              forgetpassword(),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                                  print(
                                      "Password does not match: ${error.toString()}");
                                }).whenComplete(() {
                                  setState(() {
                                    isSigningIn = false;
                                  });
                                });
                              }
                            },
                          ),
              ),
              signupOption(context),
              const Text("OR"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/google-removebg-preview.png",
                    width: 40,
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      await FirebaseServices().signInWithGoogle();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const StartingPage(),
                        ),
                      );
                    },
                    child: const Text("Continue with Gmail"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row signupOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black45),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget forgetpassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => ResetPassword()),
        ),
        child: const Text(
          "Forgot password?",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
