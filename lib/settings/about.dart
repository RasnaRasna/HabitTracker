import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Welcome to Habit Tracker!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 85, 84, 84)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: korangecolor,
                ),
                width: double.infinity,
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Habit Tracker is your personal companion for building healthy habits and achieving your goals. With features like habit tracking, completion status, and history visualization, our app helps you stay motivated and focused on your journey to a better you.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Developed by Rasna",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            kheight10,
            const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "version 1.0.0",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
