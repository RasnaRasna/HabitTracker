import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class NightroutineChallange extends StatefulWidget {
  NightroutineChallange({Key? key}) : super(key: key);

  @override
  _NightroutineChallangeState createState() => _NightroutineChallangeState();
}

class _NightroutineChallangeState extends State<NightroutineChallange> {
  final List<String> challenges = [
    "Set a consistent bedtime and wake-up time to regulate your sleep schedule.",
    "Wind down with a relaxing activity like reading or gentle stretching before bed.",
    "Create a calming evening routine that includes dimming lights and reducing screen time.",
    "Practice gratitude by jotting down a few things you're thankful for before sleep.",
    "Avoid caffeine and heavy meals in the evening to promote better sleep.",
    "Unplug from digital devices at least an hour before bed to signal your body it's time to relax.",
    "Use aromatherapy with soothing scents like lavender to create a serene sleep environment.",
    "Review your day and jot down tasks or thoughts for tomorrow to clear your mind.",
    "Set a limit on late-night snacking to avoid disrupting your digestion and sleep.",
    "Create a cozy sleep space by arranging pillows and blankets for optimal comfort.",
    "Listen to calming music or a guided meditation to help you relax and drift off to sleep.",
    "Hydrate by sipping a soothing herbal tea before bed.",
    "Practice deep breathing exercises to calm your mind and prepare for rest.",
    "Keep a journal by your bedside to jot down any last-minute thoughts or reflections.",
    "Opt for a no-screen hour before bed, allowing you to focus on calming activities.",
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
        .loadSavedChallengeValues('NightroutineChallange');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('NightroutineChallange');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('NightroutineChallange');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Night Routine",
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
                                'NightroutineChallange',
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
