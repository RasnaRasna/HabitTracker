import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class PositiveAffirmationChallanges extends StatefulWidget {
  PositiveAffirmationChallanges({Key? key}) : super(key: key);

  @override
  _PositiveAffirmationChallangesState createState() =>
      _PositiveAffirmationChallangesState();
}

class _PositiveAffirmationChallangesState
    extends State<PositiveAffirmationChallanges> {
  final List<String> challenges = [
    "Compliment at least one person each day, focusing on their strengths and qualities.",
    "Send a thoughtful text or message to someone who might be in need of encouragement.",
    "Write a note of appreciation to a coworker, friend, or family member to brighten their day.",
    "Offer words of support to someone facing a challenge or difficult situation.",
    "Share an inspiring quote or story on your social media to uplift others.",
    "Express genuine interest and enthusiasm when listening to someone's ideas or experiences.",
    "Celebrate the accomplishments of others by acknowledging their achievements.",
    "Practice active encouragement by providing constructive feedback in a positive way.",
    "Reach out to someone you haven't spoken to in a while and let them know you care.",
    "Leave kind and encouraging comments on social media posts that resonate with you.",
    "Participate in a local community event or fundraiser to show support.",
    "Offer a helping hand or assistance to someone who might be struggling.",
    "Host a virtual or in-person group discussion centered around sharing and offering encouragement.",
    "Practice self-encouragement by reminding yourself of your achievements and capabilities.",
    "Use positive language and focus on solutions when discussing challenges with others.",
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
        .loadSavedChallengeValues('PositiveAffirmationChallanges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('PositiveAffirmationChallanges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('PositiveAffirmationChallanges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Encouragement",
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
                                'PositiveAffirmationChallanges',
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
