import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class PositiveChallenges extends StatefulWidget {
  PositiveChallenges({Key? key}) : super(key: key);

  @override
  _PositiveChallengesState createState() => _PositiveChallengesState();
}

class _PositiveChallengesState extends State<PositiveChallenges> {
  final List<String> challenges = [
    "Practice smiling.smile at strangers,in the mirror,smile Whenever you can! You'll feel so much of more positive",
    "Look in the mirror and repeat these things to yourself.",
    "Spend time with someone who makes you feel loved and supported. Notice how their presence makes you feel.",
    "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity.",
    "Do something else that makes you feel good."
  ];

  List<bool> challengeValues = List<bool>.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Positive Mindset",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'if all task are completed you can share',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'make sure to tick all before you share',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('share'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('share'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.info))
        ],
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Mark the completed challenges",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.pink),
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
                      border:
                          Border.all(color: Color.fromARGB(255, 218, 213, 213)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            setState(() {
                              challengeValues[index] = newValue ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            challenges[index],
                            style: TextStyle(fontSize: 16),
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
