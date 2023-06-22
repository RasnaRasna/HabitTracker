import 'package:flutter/material.dart';

import '../const.dart';
import '../edit_habits.dart/edit_habits.dart';

class MyHomePageToday extends StatelessWidget {
  const MyHomePageToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          " Today",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [kheight50, Expanded(child: buildListViewSeparated())],
      ),
    );
  }
}

Widget buildListViewSeparated() {
  return ListView.separated(
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 125,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const EditHabits())),
            child: Card(
              // elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color.fromARGB(255, 150, 147, 147), width: 1),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Color.fromARGB(255, 229, 113, 151),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "M",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 229, 113, 151),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "T",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 229, 113, 151),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "W",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 229, 113, 151),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "T",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 246, 211, 223),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "F",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 246, 211, 223),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "S",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              Container(
                                color: Color.fromARGB(255, 246, 211, 223),
                                width: 18,
                                height: 18,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5),
                                  child: Text(
                                    "S",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              KWidth7,
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_circle,
                                  color: Color.fromARGB(255, 229, 113, 151),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
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
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 10);
    },
    itemCount: 10, // Replace with the actual number of items
  );
}
