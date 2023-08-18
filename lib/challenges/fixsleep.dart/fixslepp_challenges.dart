import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/savebuttonstate.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FixsleepShedule extends StatefulWidget {
  FixsleepShedule({Key? key}) : super(key: key);

  @override
  _FixsleepSheduleState createState() => _FixsleepSheduleState();
}

class _FixsleepSheduleState extends State<FixsleepShedule> {
  final List<String> challenges = [
    "Create a calming bedtime routine and stick to it for a week to promote better sleep.",
    "Limit screen time at least an hour before bed to signal your body it's time to wind down.",
    "Set a consistent sleep schedule, aiming for the same bedtime and wake-up time every day.",
    "Create a comfortable sleep environment by adjusting lighting, noise, and temperature.",
    "Try a week of meditation or deep breathing exercises before bed to relax your mind.",
    "Avoid caffeine and heavy meals in the evening for more peaceful sleep.",
    "Replace evening digital entertainment with reading a book to prepare your mind for sleep.",
    "Experiment with different pillow and mattress setups to find what provides the best comfort.",
    "Engage in light stretching or yoga before bed to release tension and promote relaxation.",
    "Practice gratitude journaling before sleep, focusing on positive thoughts.",
    "Keep a sleep journal for a week to track patterns and identify areas for improvement.",
    "Use a white noise machine or calming sounds to create a soothing sleep environment.",
    "Opt for herbal tea or warm milk instead of caffeinated drinks before bedtime.",
    "Avoid heavy exercise close to bedtime and aim for earlier in the day.",
    "Consider a technology-free bedroom to eliminate sleep-disrupting screens.",
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
        .loadSavedChallengeValues('FixsleepShedule');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('FixsleepShedule');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('FixsleepShedule');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Better Sleep",
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
                                'FixsleepShedule', index, newValue ?? false);
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
