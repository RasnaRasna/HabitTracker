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
    "Commit to a 10-minute home workout routine every morning.",
    "Try a different home workout video or routine each day to keep things interesting.",
    "Set a goal to complete a certain number of push-ups, squats, or other exercises each day.",
    "Create a home workout playlist with motivating music to keep you pumped.",
    "Challenge yourself to improve your flexibility through daily stretching.",
    "Engage in a HIIT (High-Intensity Interval Training) workout for 20 minutes every day.",
    "Use household items like water bottles or chairs for resistance exercises.",
    "Join an online fitness class or follow a live workout session each day.",
    "Mix cardio and strength training with alternating days of running or jumping rope.",
    "Start your day with a morning yoga routine to energize your body and mind.",
    "Set a timer and do a mini workout break every hour during your work or study sessions.",
    "Include bodyweight exercises like planks, lunges, and burpees in your routine.",
    "Create a workout calendar with specific exercises for each day of the week.",
    "Challenge yourself to hold a plank for a longer duration each day.",
    "Document your progress by tracking the number of reps or weights used in your workouts.",
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
