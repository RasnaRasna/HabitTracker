import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class NewdayNewYou extends StatefulWidget {
  NewdayNewYou({Key? key}) : super(key: key);

  @override
  _NewdayNewYouState createState() => _NewdayNewYouState();
}

class _NewdayNewYouState extends State<NewdayNewYou> {
  final List<String> challenges = [
    "Start your day with a positive affirmation to set the tone for a fresh beginning.",
    "Set a small goal for the day that aligns with a positive change you want to make.",
    "Practice mindfulness in the morning, focusing on the present moment.",
    "Choose one thing to let go of from the previous day to make room for new possibilities.",
    "Embrace a growth mindset by seeking out opportunities to learn and improve.",
    "Identify one habit or behavior you'd like to change and take a step toward that change.",
    "Engage in a morning journaling session to reflect on your goals and intentions.",
    "Try something new today, whether it's a new activity, food, or experience.",
    "Express gratitude for the opportunities and experiences the new day brings.",
    "Connect with someone new or reach out to an old friend to foster meaningful relationships.",
    "Declutter a small area of your space to create a sense of order and renewal.",
    "Take a few minutes to stretch or do a short workout to invigorate your body.",
    "Choose a positive mantra for the day and repeat it whenever you need a boost.",
    "Set aside time for self-care, focusing on activities that bring you joy and relaxation.",
    "Reflect on the progress you've made and the person you're becoming with each new day.",
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
        .loadSavedChallengeValues('NewdayNewYou');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('NewdayNewYou');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('NewdayNewYou');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Day New You",
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
                                'NewdayNewYou', index, newValue ?? false);
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
