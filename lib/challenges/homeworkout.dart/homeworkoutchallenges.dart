import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/savebuttonstate.dart';
import 'package:habits_track/bottom_pages/challenges/showdialogue.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWrokOutChallages extends StatefulWidget {
  HomeWrokOutChallages({Key? key}) : super(key: key);

  @override
  _HomeWrokOutChallagesState createState() => _HomeWrokOutChallagesState();
}

class _HomeWrokOutChallagesState extends State<HomeWrokOutChallages> {
  final List<String> challenges = [
    "Write down 10 things you love about yourself.",
    "Look in the mirror and repeat these things to yourself.",
    "Spend time with someone who makes you feel loved and supported. Notice how their presence makes you feel.",
    "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity.",
    "Do something else that makes you feel good."
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
        .loadSavedChallengeValues('HomeWrokOutChallages');
    // Set the loaded checkbox values to the local variable.
    setState(() {
      challengeValues = context
          .read<ChallengeState>()
          .getChallengeValues('HomeWrokOutChallages');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> challengeValues = context
        .watch<ChallengeState>()
        .getChallengeValues('HomeWrokOutChallages');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home workout",
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
                      color: korangecolor,
                      border:
                          Border.all(color: Color.fromARGB(255, 218, 213, 213)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: kwhite,
                          checkColor: kredcolor,
                          side: BorderSide(color: kwhite, width: 2),
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            context.read<ChallengeState>().updateChallengeValue(
                                'HomeWrokOutChallages',
                                index,
                                newValue ?? false);
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              challenges[index],
                              style: TextStyle(fontSize: 16, color: kwhite),
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
