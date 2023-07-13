// import 'package:flutter/material.dart';
// import 'package:habits_track/bottom_pages/bottom_bar.dart';
// import 'package:habits_track/const.dart';

// class StartingPage extends StatefulWidget {
//   const StartingPage({Key? key}) : super(key: key);

//   @override
//   State<StartingPage> createState() => _StartingPageState();
// }

// class _StartingPageState extends State<StartingPage> {
//   String? selectedGender;
//   TextEditingController nameController = TextEditingController();
//   bool isNameValid = true;

//   void validateForm() {
//     setState(() {
//       isNameValid = nameController.text.isNotEmpty;
//     });
//     if (isNameValid && selectedGender != null) {
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (ctx) => bottombar(
//                 selectedGender: selectedGender,
//                 name: nameController.text,
//               )));
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: Text("Alert"),
//               content: Text("Please enter your name and select a gender."),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("OK"),
//                 )
//               ]);
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 40),
//                 child: Text(
//                   "Nice to Meet You",
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Container(
//                 height: 70,
//                 width: 290,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.pink.shade100),
//                 ),
//                 child: TextField(
//                   controller: nameController,
//                   // textAlign: TextAlign.center,
//                   decoration: const InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(vertical: 20),
//                     hintText: "What is your name  ?",
//                     prefixIcon: Icon(Icons.person), // Added prefixIcon property
//                     hintStyle: TextStyle(
//                       fontSize: 14,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Create the life you love  🖤",
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedGender =
//                             selectedGender == "Male" ? null : "Male";
//                       });
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(
//                           color: selectedGender == "Male"
//                               ? Colors.pink.shade100
//                               : Colors.grey,
//                         ),
//                         color: selectedGender == "Male"
//                             ? Colors.pink.shade100
//                             : Colors.transparent,
//                       ),
//                       width: 100,
//                       height: 40,
//                       child: const Center(
//                           child: Text(
//                         'Male',
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       )),
//                     ),
//                   ),
//                   Kwidth,
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedGender =
//                             selectedGender == "Female" ? null : "Female";
//                       });
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(
//                           color: selectedGender == "Female"
//                               ? Colors.pink.shade100
//                               : Colors.grey,
//                         ),
//                         color: selectedGender == "Female"
//                             ? Colors.pink.shade100
//                             : Colors.transparent,
//                       ),
//                       width: 100,
//                       height: 40,
//                       child: const Center(
//                           child: Text(
//                         'Female',
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: validateForm,
//                   child: CircleAvatar(
//                     radius: 30,
//                     child: Icon(Icons.arrow_forward),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habits_track/provider/genderprovider.dart';
import 'package:provider/provider.dart';

import '../bottom_pages/bottom_bar.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Nice to Meet You",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 70,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: TextField(
                  onChanged: (value) =>
                      Provider.of<GenderProvider>(context, listen: false)
                          .setName(value),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    hintText: "What is your name?",
                    prefixIcon: Icon(Icons.person),
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Create the life you love 🖤",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                children: [
                  Consumer<GenderProvider>(
                    builder: (context, genderProvider, _) => GestureDetector(
                      onTap: () {
                        final selectedGender = genderProvider.selectedGender;
                        genderProvider.setGender(
                          selectedGender == "Male" ? null : "Male",
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: genderProvider.selectedGender == "Male"
                                ? Colors.pink.shade100
                                : Colors.grey,
                          ),
                          color: genderProvider.selectedGender == "Male"
                              ? Colors.pink.shade100
                              : Colors.transparent,
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Male',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Consumer<GenderProvider>(
                    builder: (context, genderProvider, _) => GestureDetector(
                      onTap: () {
                        final selectedGender = genderProvider.selectedGender;
                        genderProvider.setGender(
                          selectedGender == "Female" ? null : "Female",
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: genderProvider.selectedGender == "Female"
                                ? Colors.pink.shade100
                                : Colors.grey,
                          ),
                          color: genderProvider.selectedGender == "Female"
                              ? Colors.pink.shade100
                              : Colors.transparent,
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Female',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    final genderProvider =
                        Provider.of<GenderProvider>(context, listen: false);
                    final selectedGender = genderProvider.selectedGender;
                    final name = genderProvider.name;

                    if (name.isNotEmpty && selectedGender != null) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (ctx) => bottombar(
                            selectedGender: selectedGender,
                            name: name,
                          ),
                        ),
                        (route) => false,
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Alert"),
                            content: Text(
                              "Please enter your name and select a gender.",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
