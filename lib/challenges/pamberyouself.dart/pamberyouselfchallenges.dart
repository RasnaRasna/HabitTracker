import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class pamber extends StatefulWidget {
  pamber({Key? key}) : super(key: key);

  @override
  _pamberState createState() => _pamberState();
}

class _pamberState extends State<pamber> {
  final List<String> challenges = [
    "Indulge in a luxurious bubble bath for a moment of relaxation.",
    "Set aside an evening for a DIY spa night with masks, scrubs, and soothing music.",
    "Treat yourself to your favorite dessert guilt-free and savor every bite.",
    "Dedicate a day to unplugging from technology and enjoying simple pleasures.",
    "Create a cozy reading nook and spend an afternoon with a captivating book.",
    "Try a new hairstyle or experiment with your makeup for a fresh look.",
    "Practice meditation or deep breathing to unwind and de-stress.",
    "Plan a movie marathon with your favorite films and snacks.",
    "Take a leisurely walk in a scenic spot and appreciate the beauty around you.",
    "Cook a special meal just for yourself, focusing on flavors and presentation.",
    "Engage in a hobby or activity that brings you joy, whether it's painting, dancing, or gardening.",
    "Write down three things you love about yourself and reflect on them.",
    "Visit a local café or bakery and savor a delicious treat with a warm beverage.",
    "Buy yourself flowers or a small gift that brings a smile to your face.",
    "Spend time in nature, whether it's a park, beach, or forest, to recharge your spirit.",
  ];

  List<bool> challengeValues = List<bool>.generate(15, (index) => false);
  void initState() {
    super.initState();
    // Load the saved checkbox states when the screen is initialized.
    _loadSavedChallengeValues();
  }

  Future<void> _loadSavedChallengeValues() async {
    await context.read<ChallengeState>().loadSavedChallengeValues('pamber');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('pamber');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('pamber');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pamper youself",
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
                                'pamber', index, newValue ?? false);
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
