import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/savebuttonstate.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoJunckfoodd extends StatefulWidget {
  NoJunckfoodd({Key? key}) : super(key: key);

  @override
  _NoJunckfooddState createState() => _NoJunckfooddState();
}

class _NoJunckfooddState extends State<NoJunckfoodd> {
  final List<String> challenges = [
    "Replace one junk food item with a healthier snack each day for a week.",
    "Commit to drinking water whenever you feel the urge to snack on junk food.",
    "Clear your pantry of junk food and stock up on nutritious alternatives.",
    "Try a week of meal prepping to ensure you have healthy options readily available.",
    "Keep a food journal to track your progress and identify triggers for junk food cravings.",
    "Experiment with making your favorite junk food at home using healthier ingredients.",
    "Practice mindful eating by savoring each bite of your meals and snacks.",
    "Plan balanced meals that include a mix of lean protein, whole grains, and vegetables.",
    "Reward yourself with a non-food treat every time you successfully resist junk food.",
    "Find healthy substitutions for your favorite junk food cravings, like baked sweet potato fries instead of regular fries.",
    "Avoid eating in front of screens to prevent mindless snacking.",
    "Choose whole, unprocessed foods that are both nutritious and satisfying.",
    "Create a colorful plate by incorporating a variety of fruits and vegetables.",
    "Practice portion control by using smaller plates and bowls for your meals.",
    "Remind yourself of your health goals whenever you're tempted by junk food.",
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
        .loadSavedChallengeValues('NoJunckfoodd');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('NoJunckfoodd');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('NoJunckfoodd');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "No junk food",
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
                                'NoJunckfoodd', index, newValue ?? false);
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
