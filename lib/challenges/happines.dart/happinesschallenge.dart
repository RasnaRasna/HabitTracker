import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class HappyChallange extends StatefulWidget {
  HappyChallange({Key? key}) : super(key: key);

  @override
  _HappyChallangeState createState() => _HappyChallangeState();
}

class _HappyChallangeState extends State<HappyChallange> {
  final List<String> challenges = [
    "Start each day by listing three things you're grateful for.",
    "Engage in a physical activity that brings you joy and boosts your mood.",
    "Connect with a friend or loved one each day, even if it's just a short conversation.",
    "Laugh heartily each day, whether by watching a funny video or sharing jokes.",
    "Practice mindfulness or meditation to stay present and find inner peace.",
    "Engage in a creative activity that brings you happiness, whether it's drawing, writing, or crafting.",
    "Spend time outdoors and connect with nature to uplift your spirits.",
    "Treat yourself to something you enjoy, whether it's a favorite treat, book, or activity.",
    "Write down a positive affirmation or mantra and repeat it daily.",
    "Engage in acts of kindness, both for others and for yourself.",
    "Dedicate time to a hobby or passion that brings you a sense of accomplishment.",
    "Listen to your favorite music or watch a feel-good movie to boost your mood.",
    "Reflect on a happy memory or experience to bring a smile to your face.",
    "Practice deep breathing to release stress and promote relaxation.",
    "Surround yourself with positive and uplifting people who contribute to your happiness.",
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
        .loadSavedChallengeValues('HappyChallange');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('HappyChallange');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('HappyChallange');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Happiness",
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
                                'HappyChallange', index, newValue ?? false);
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
