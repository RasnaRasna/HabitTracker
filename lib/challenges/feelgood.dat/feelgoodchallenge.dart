import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/savebuttonstate.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';

class FeelGoodChallanges extends StatefulWidget {
  FeelGoodChallanges({Key? key}) : super(key: key);

  @override
  _FeelGoodChallangesState createState() => _FeelGoodChallangesState();
}

class _FeelGoodChallangesState extends State<FeelGoodChallanges> {
  final List<String> challenges = [
    "Start your day with a smile and positive affirmation to set a cheerful tone.",
    "Engage in a 5-minute meditation or deep breathing exercise to center yourself.",
    "Do something creative each day, whether it's drawing, crafting, or writing.",
    "Spend time outdoors and soak up some natural sunlight for a mood boost.",
    "Listen to your favorite music or a calming playlist to uplift your spirits.",
    "Connect with a loved one or friend and share a positive experience or thought.",
    "Treat yourself to a small indulgence, like your favorite snack or a soothing tea.",
    "Watch a funny movie or show to have a good laugh and lighten your mood.",
    "Practice gratitude by writing down three things you're thankful for each day.",
    "Try a new recipe or treat yourself to a delicious meal that brings joy.",
    "Engage in a hobby or activity that you find truly enjoyable and fulfilling.",
    "Declutter a small area of your living space to create a sense of order and calm.",
    "Spend quality time with a pet, as their presence often brings happiness.",
    "Set a timer for a quick dance session to get your body moving and raise your spirits.",
    "Reflect on a past achievement or positive memory to boost your self-confidence.",
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
        .loadSavedChallengeValues('FeelGoodChallanges');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('FeelGoodChallanges');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('FeelGoodChallanges');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Feel good",
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
                                'FeelGoodChallanges', index, newValue ?? false);
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
