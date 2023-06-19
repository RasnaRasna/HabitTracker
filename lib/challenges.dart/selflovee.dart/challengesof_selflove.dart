// import 'package:flutter/material.dart';
// import 'package:habits_track/const.dart';
// import 'package:habits_track/provider.dart/checkbox.dart';
// import 'package:provider/provider.dart';

// class SelfLoveChallenges extends StatelessWidget {
//   SelfLoveChallenges({super.key});

//   final List<String> challenges = [
//     "Write down 10 things you love about yourself.",
//     "Look in the mirror and repeat these things to yourself.",
//     "Spend time with someone who makes you feel loved and supported. Notice how their presence makes you feel.",
//     "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity.",
//     "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity."
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final checkboxProvider = Provider.of<CheckboxProvider>(context);
//     checkboxProvider.initializeCheckboxStates(challenges.length);
//     return Scaffold(
//       appBar: AppBar(
//         actions: const [
//           Text(
//             "Self Love",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const Align(
//             alignment: Alignment.topCenter,
//             child: Text(
//               "Mark the completed challenges",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ),
//           kheight20,
//           Expanded(
//             child: ListView.builder(
//               itemCount: challenges.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border:
//                           Border.all(color: Color.fromARGB(255, 218, 213, 213)),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: checkboxProvider.checkboxstates[index],
//                           onChanged: (  value) {
//                             checkboxProvider.updateCheckboxState(index,value);
//                           },
//                         ),
//                         Expanded(
//                           child: Text(
//                             challenges[index],
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class SelfLoveChallenges extends StatefulWidget {
  SelfLoveChallenges({Key? key}) : super(key: key);

  @override
  _SelfLoveChallengesState createState() => _SelfLoveChallengesState();
}

class _SelfLoveChallengesState extends State<SelfLoveChallenges> {
  final List<String> challenges = [
    "Write down 10 things you love about yourself.",
    "Look in the mirror and repeat these things to yourself.",
    "Spend time with someone who makes you feel loved and supported. Notice how their presence makes you feel.",
    "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity.",
    "Do something else that makes you feel good."
  ];

  List<bool> challengeValues = List<bool>.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(
            "Self Love",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Mark the completed challenges",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          kheight20,
          Expanded(
            child: ListView.builder(
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 218, 213, 213)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            setState(() {
                              challengeValues[index] = newValue ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            challenges[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
