import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class StudyChallanges extends StatefulWidget {
  StudyChallanges({Key? key}) : super(key: key);

  @override
  _StudyChallangesState createState() => _StudyChallangesState();
}

class _StudyChallangesState extends State<StudyChallanges> {
  final List<String> challenges = [
    "Create a dedicated study space and commit to using it for a certain amount of time each day.",
    "Set specific goals for each study session, such as completing a certain number of pages or problems.",
    "Practice the Pomodoro Technique: Study for 25 minutes, then take a 5-minute break.",
    "Review your notes or materials from the previous day's study session before starting anew.",
    "Use active learning techniques, such as summarizing, teaching, or quizzing yourself.",
    "Seek out different resources like videos, articles, or podcasts to enhance your understanding.",
    "Join a study group or find a study partner to discuss and review concepts.",
    "Take handwritten notes to improve retention and comprehension.",
    "Break down larger topics into smaller, manageable chunks to avoid feeling overwhelmed.",
    "Quiz yourself on the material you've studied at the end of each session.",
    "Teach a concept or topic to someone else, even if it's just explaining it out loud.",
    "Stay organized with digital tools or physical planners to track your study progress.",
    "Reward yourself with a short break or a treat after completing a study session.",
    "Set a schedule and stick to it, allocating specific time slots for studying.",
    "Review your progress at the end of each week and adjust your study strategies as needed.",
  ];

  List<bool> challengeValues = List<bool>.generate(15, (index) => false);
  void initState() {
    super.initState();
    // Load the saved checkbox states when the screen is initialized.
    _loadSavedChallengeValues();
  }

  Future<void> _loadSavedChallengeValues() async {
    await context
        .read<ChallengeState>()
        .loadSavedChallengeValues('StudyChallanges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('StudyChallanges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('StudyChallanges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Study",
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
                                'StudyChallanges', index, newValue ?? false);
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              challenges[index],
                              style: TextStyle(fontSize: 16, color: kblack),
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
