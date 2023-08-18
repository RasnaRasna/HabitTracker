import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class walkingChallenges extends StatefulWidget {
  walkingChallenges({Key? key}) : super(key: key);

  @override
  _walkingChallengesState createState() => _walkingChallengesState();
}

class _walkingChallengesState extends State<walkingChallenges> {
  final List<String> challenges = [
    "   Aim to walk a new route each week to keep things interesting.",
    "Practice mindful walking by focusing on each step and your surroundings.",
    "Set a daily step goal and track your progress to stay motivated.",
    "Take a nature walk to connect with the outdoors and boost your mood.",
    "Challenge yourself to a power walk, picking up the pace for a good workout.",
    "Walk and talk by making calls while getting your steps in.",
    "Capture interesting sights during your walk with a photography challenge.",
    "Choose stairs over elevators for an extra step challenge throughout the day.",
    "Enjoy a calming walking meditation to clear your mind and relax.",
    "Join a charity walk to give back while improving your fitness.",
    "Involve your family in a group walk for quality bonding time.",
    "Listen to upbeat music as you walk to add an extra layer of fun.",
    "Walk during sunrise or sunset for a scenic and peaceful experience.",
    "Explore historical sites in your area on foot to learn as you move.",
    "Incorporate intervals of faster walking for a varied workout.",
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
        .loadSavedChallengeValues('walkingChallenges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('walkingChallenges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('walkingChallenges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Walking",
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
                                'walkingChallenges', index, newValue ?? false);
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
