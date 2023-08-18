import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';
import '../../bottom_pages/challenges/showdialogue.dart';

class FamilyChallanges extends StatefulWidget {
  FamilyChallanges({Key? key}) : super(key: key);

  @override
  _FamilyChallangesState createState() => _FamilyChallangesState();
}

class _FamilyChallangesState extends State<FamilyChallanges> {
  final List<String> challenges = [
    "Have a technology-free family dinner at least three times a week.",
    "Plan a family game night with board games, card games, or interactive video games.",
    "Designate a 'Family Fun Day' once a month for an outing or special activity.",
    "Cook a meal or bake together as a family, involving everyone in the process.",
    "Share stories or memories from each family member's day during a designated time.",
    "Create a family photo album or scrapbook together to capture and cherish memories.",
    "Engage in a DIY project or craft as a family, working collaboratively.",
    "Set aside time for a weekly family movie or TV show night.",
    "Plan a family hike, picnic, or outdoor adventure to enjoy nature together.",
    "Hold a family book club where everyone reads the same book and discusses it.",
    "Take turns choosing and preparing a meal or activity, rotating responsibilities.",
    "Organize a family talent show, allowing each member to showcase their skills.",
    "Visit a local museum, park, or attraction as a family to explore and learn together.",
    "Practice gratitude by sharing one thing each family member is thankful for daily.",
    "Engage in a family volunteer activity to give back to the community together.",
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
        .loadSavedChallengeValues('FamilyChallanges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('FamilyChallanges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('FamilyChallanges');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Family Time",
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
                                'FamilyChallanges', index, newValue ?? false);
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
