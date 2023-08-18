import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class KindesChallanges extends StatefulWidget {
  KindesChallanges({Key? key}) : super(key: key);

  @override
  _KindesChallangesState createState() => _KindesChallangesState();
}

class _KindesChallangesState extends State<KindesChallanges> {
  final List<String> challenges = [
    "Perform one random act of kindness for someone each day.",
    "Compliment at least one person each day, focusing on their positive qualities.",
    "Send a heartfelt note or message to someone you appreciate or miss.",
    "Volunteer your time or skills to a local charity or organization.",
    "Hold the door open for others or perform small gestures of courtesy throughout the day.",
    "Engage in active listening during conversations, showing genuine interest in others.",
    "Donate unused items to a local shelter or charity.",
    "Pay for someone's coffee or meal anonymously.",
    "Offer assistance to someone who might need help, whether it's carrying bags or offering directions.",
    "Share uplifting or positive content on your social media to brighten someone's day.",
    "Help a coworker or friend with a task or challenge they're facing.",
    "Plant a tree or contribute to a sustainable initiative to show kindness to the planet.",
    "Cook or bake something for a neighbor, friend, or family member.",
    "Practice patience and understanding in interactions, especially in challenging situations.",
    "Smile and greet strangers with kindness throughout the day.",
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
        .loadSavedChallengeValues('KindesChallanges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('KindesChallanges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('KindesChallanges');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kindness",
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
                          side: BorderSide(color: korangecolor, width: 2),
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            context.read<ChallengeState>().updateChallengeValue(
                                'KindesChallanges', index, newValue ?? false);
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
