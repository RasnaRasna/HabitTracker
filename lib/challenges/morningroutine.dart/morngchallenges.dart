import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class MorningRoutineChallange extends StatefulWidget {
  MorningRoutineChallange({Key? key}) : super(key: key);

  @override
  _MorningRoutineChallangeState createState() =>
      _MorningRoutineChallangeState();
}

class _MorningRoutineChallangeState extends State<MorningRoutineChallange> {
  final List<String> challenges = [
    "Start your day with a glass of water to hydrate your body and kickstart your metabolism.",
    "Create a morning gratitude practice by listing three things you're thankful for.",
    "Incorporate stretching or light yoga to wake up your body and boost circulation.",
    "Practice deep breathing or meditation for a few minutes to set a positive tone for the day.",
    "Enjoy a nutritious breakfast that includes a balance of protein, carbs, and healthy fats.",
    "Set aside time for a quick workout or brisk walk to energize your body.",
    "Limit screen time during the first hour after waking up to avoid overwhelm.",
    "Plan your day by creating a to-do list or setting your priorities.",
    "Avoid checking emails or messages until after your morning routine to reduce stress.",
    "Create a specific and consistent morning routine to establish a sense of structure.",
    "Make your bed as soon as you wake up to start your day with a sense of accomplishment.",
    "Spend a few minutes visualizing your goals and intentions for the day.",
    "Read or listen to something inspiring to set a positive and motivated mindset.",
    "Practice a skincare routine to refresh your skin and boost your confidence.",
    "Enjoy a moment of silence or listen to calming music to ease into your day.",
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
        .loadSavedChallengeValues('MorningRoutineChallange');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('MorningRoutineChallange');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('MorningRoutineChallange');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Morning  Routine",
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
                                'MorningRoutineChallange',
                                index,
                                newValue ?? false);
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
