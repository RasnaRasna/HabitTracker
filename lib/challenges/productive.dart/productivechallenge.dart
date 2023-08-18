import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class Productivity extends StatefulWidget {
  Productivity({Key? key}) : super(key: key);

  @override
  _ProductivityState createState() => _ProductivityState();
}

class _ProductivityState extends State<Productivity> {
  final List<String> challenges = [
    "Start your day with a to-do list and prioritize tasks for increased productivity.",
    "Try the Pomodoro Technique: Work for 25 minutes, then take a 5-minute break.",
    "Set specific goals for the day to stay focused and motivated.",
    "Declutter your workspace for improved concentration and efficiency.",
    "Limit multitasking and focus on one task at a time to enhance productivity.",
    "Allocate dedicated time for emails and messages to avoid constant interruptions.",
    "Take on a challenging task first thing in the morning to tackle it with fresh energy.",
    "Use productivity apps to track tasks, set reminders, and manage your time.",
    "Review your achievements at the end of the day and plan for tomorrow.",
    "Practice deep work: Set aside uninterrupted blocks of time for focused tasks.",
    "Delegate tasks that can be handled by others to free up your time.",
    "Experiment with different methods of organizing your tasks, such as the Eisenhower Matrix.",
    "Create a minimalist workspace to minimize distractions and boost concentration.",
    "Practice mindfulness or meditation to clear your mind and enhance your focus.",
    "Take breaks and stretch throughout the day to recharge your energy.",
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
        .loadSavedChallengeValues('Productivity');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('Productivity');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('Productivity');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Productivity",
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
                                'Productivity', index, newValue ?? false);
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
