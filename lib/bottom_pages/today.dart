import 'package:flutter/material.dart';

import '../addhabits.dart/add_habits.dart';
import '../const.dart';
import '../edit_habits.dart/edit_habits.dart';
import '../side_drawer.dart';

class MyHomePageToday extends StatelessWidget {
  const MyHomePageToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Do the best You can..",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const Addhabits()));
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      drawer: const SideDrawer(),
      body: ListView(
        children: [
          kheight50,
          habit_items(context),
          kheight10,
          habit_items(context),
          kheight10,
          habit_items(context),
          kheight10,
          habit_items(context),
          kheight10,
          habit_items(context),
        ],
      ),
    );
  }

  Container habit_items(BuildContext context) {
    return Container(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const EditHabits())),
          child: Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 121, 121, 121), width: 1),
              ),
              child: Stack(
                children: [
                  const Positioned(
                      top: 20,
                      left: 10,
                      child: Text(
                        "🔥 3",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  kheight10,
                  const Positioned(
                    top: 60,
                    left: 10,
                    child: Text(
                      "🧘‍♂️ Meditation",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 239, 135, 135),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "M",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 239, 135, 135),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "T",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 239, 135, 135),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "W",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 251, 204, 204),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "T",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 251, 204, 204),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "F",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 251, 204, 204),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "S",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            Container(
                              color: const Color.fromARGB(255, 251, 204, 204),
                              width: 18,
                              height: 18,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Text(
                                  "S",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            KWidth7,
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            ),
                            KWidth7,
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "3/7",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
