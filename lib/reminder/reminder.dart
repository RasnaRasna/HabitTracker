import 'package:flutter/material.dart';
import 'package:habits_track/addhabits.dart/add_habits.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/reminder/addreminder.dart';

class Reminderpage extends StatelessWidget {
  const Reminderpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Addhabits()));
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AddReminders()));
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Text("Reminders"),
        ),
        body: ListView(children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Notification will be sent if you haven't completed your habit. In the case of non-daily weekly goals, you won't receive any more notifications this week.",
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                tileColor: const Color.fromARGB(255, 223, 220, 220),
                title: Text('🔔   11:30 PM'),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Mon-Tue-Wed-Thu-Fri-Sat-Sun \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '📚 Read',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            kheight10,
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                tileColor: const Color.fromARGB(255, 223, 220, 220),
                title: Text('🔔   11:30 PM'),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Mon-Tue-Wed-Thu-Fri-Sat-Sun \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '✍️  Write',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            kheight10,
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                tileColor: const Color.fromARGB(255, 223, 220, 220),
                title: Text('🔔   11:30 PM'),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Mon-Tue-Wed-Thu-Fri-Sat-Sun \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '🏃 Run',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            kheight10,
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                tileColor: const Color.fromARGB(255, 223, 220, 220),
                title: Text('🔔   11:30 PM'),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Mon-Tue-Wed-Thu-Fri-Sat-Sun \n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '🧘 Meditation',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            kheight10,
          ]),
        ]));
  }
}
