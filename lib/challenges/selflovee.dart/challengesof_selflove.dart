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
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

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
  void initState() {
    super.initState();
    // Load the saved checkbox states when the screen is initialized.
    _loadSavedChallengeValues();
  }

  Future<void> _loadSavedChallengeValues() async {
    await context
        .read<ChallengeState>()
        .loadSavedChallengeValues('SelfLoveChallenges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('SelfLoveChallenges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('SelfLoveChallenges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Self Love",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [Showdialoguee(challengeValues: challengeValues)],
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Mark the completed challenges",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: kredcolor),
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
                      border: Border.all(color: korangecolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: kwhite,
                          checkColor: kredcolor,
                          side: BorderSide(color: kredcolor, width: 2),
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            context.read<ChallengeState>().updateChallengeValue(
                                'SelfLoveChallenges', index, newValue ?? false);
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              challenges[index],
                              style:
                                  const TextStyle(fontSize: 16, color: kblack),
                            ),
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
