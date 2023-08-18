import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class LanguageChallenge extends StatefulWidget {
  LanguageChallenge({Key? key}) : super(key: key);

  @override
  _LanguageChallengeState createState() => _LanguageChallengeState();
}

class _LanguageChallengeState extends State<LanguageChallenge> {
  final List<String> challenges = [
    "Learn five new vocabulary words in your target language every day.",
    "Watch a short video or listen to a podcast in the language you're learning each day.",
    "Set a timer for 15 minutes and practice speaking or writing in the new language.",
    "Label objects around your home with their names in the target language.",
    "Read a news article or a passage in the language you're learning daily.",
    "Engage in a language exchange with a native speaker or fellow learner.",
    "Learn a popular song or poem in the target language and practice singing or reciting it.",
    "Use language learning apps or platforms for consistent practice.",
    "Write a journal entry about your day in the new language.",
    "Challenge yourself to hold a conversation in the new language each day, even if it's just with yourself.",
    "Immerse yourself by changing the language settings on your devices.",
    "Listen to an audiobook or an e-book in the language you're learning.",
    "Engage in language-related games or puzzles to make learning fun.",
    "Join online language learning communities to interact with fellow learners.",
    "Set a specific language learning goal for the day, such as mastering a particular grammar concept.",
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
        .loadSavedChallengeValues('LanguageChallenge');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('LanguageChallenge');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues =
        context.watch<ChallengeState>().getChallengeValues('LanguageChallenge');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Languages",
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
                                'LanguageChallenge', index, newValue ?? false);
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
