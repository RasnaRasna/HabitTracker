import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/savebuttonstate.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PositiveChallenges extends StatefulWidget {
  PositiveChallenges({Key? key}) : super(key: key);

  @override
  _PositiveChallengesState createState() => _PositiveChallengesState();
}

class _PositiveChallengesState extends State<PositiveChallenges> {
  final List<String> challenges = [
    "Start your day with a positive affirmation or mantra.",
    "Practice gratitude by writing down three things you're thankful for each day.",
    "Replace negative self-talk with positive and empowering thoughts.",
    "Challenge yourself to find the silver lining in a challenging situation.",
    "Engage in mindfulness or meditation to center yourself and promote positivity.",
    "Surround yourself with positive influences, whether it's people, books, or media.",
    "Practice reframing: Turn a negative thought into a positive or constructive one.",
    "Reflect on your accomplishments and progress regularly.",
    "Choose to see setbacks as opportunities for growth and learning.",
    "Limit exposure to negative news or content that brings you down.",
    "Practice kindness and compassion toward yourself and others.",
    "Visualize your goals and dreams as if they're already happening.",
    "Laugh daily, whether by watching a comedy show or sharing a funny story.",
    "Focus on solutions instead of dwelling on problems.",
    "Surprise someone with a random act of kindness to boost your own positivity.",
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
        .loadSavedChallengeValues('PositiveChallenges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('PositiveChallenges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('PositiveChallenges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Positive Mindset",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Showdialoguee(challengeValues: challengeValues),
        ],
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
                                'PositiveChallenges', index, newValue ?? false);
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
