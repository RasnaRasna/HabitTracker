import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class Socailmedia extends StatefulWidget {
  Socailmedia({Key? key}) : super(key: key);

  @override
  _SocailmediaState createState() => _SocailmediaState();
}

class _SocailmediaState extends State<Socailmedia> {
  final List<String> challenges = [
    "Disconnect from screens in the morning and night for a refreshing start and restful sleep.",
    "Enjoy meals without screens to fully appreciate the flavors and be in the moment.",
    "Take device-free walks to immerse yourself in nature and your surroundings.",
    "Allocate an hour daily without notifications to focus on other activities.",
    "Dedicate time to read a physical book, embracing the joy of turning pages.",
    "Prioritize screen-free evenings to promote better sleep and relaxation.",
    "Step away from social media for a day to reclaim time and mental clarity.",
    "Rediscover offline hobbies like drawing, crafting, or playing an instrument.",
    "Designate phone-free zones at home, such as the dining area or bedroom.",
    "Organize digital files, emails, and apps for a clutter-free digital space.",
    "Swap typing for writing with pen and paper for a tactile experience.",
    "Engage in tech-free conversations, giving your full attention to the interaction.",
    "Embrace outdoor activities and adventure without the presence of screens.",
    "Practice mindfulness instead of reaching for your phone during your detox.",
    "Unfollow accounts that bring negativity during your detox, curating a positive digital environment.",
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
        .loadSavedChallengeValues('Socailmedia');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues =
          context.read<ChallengeState>().getChallengeValues('Socailmedia');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('Socailmedia');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Digital Detox",
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
                                'Socailmedia', index, newValue ?? false);
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
