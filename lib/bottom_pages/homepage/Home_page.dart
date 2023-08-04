import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/addhabits/add_habits.dart';
import 'package:habits_track/bottom_pages/homepage/card.dart';
import 'package:habits_track/bottom_pages/homepage/hidden_drawe.dart';
import 'package:habits_track/bottom_pages/homepage/moodcheck.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';

import '../../provider/genderprovider.dart';
import '../../side_drawer.dart';

class Homapage extends StatelessWidget {
  final List<Map<String, dynamic>> habitHistory;

  final String? selectedGender;

  final String? name;

  const Homapage(
      {Key? key,
      required this.selectedGender,
      required this.name,
      required this.habitHistory})
      : super(key: key);

  String getGreeting() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 5 && currentHour < 12) {
      return 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 17) {
      return 'Good Afternoon';
    } else if (currentHour >= 17 && currentHour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);
    final String? selectedGender = genderProvider.selectedGender;
    final String name = genderProvider.name;

    String imagePath =
        selectedGender == "Female" ? "images/girl.png" : "images/boy.png";
    print('habitHistory homapge : $habitHistory');

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (ctx) => MyHomePageToday(
                          habitHistory: habitHistory,
                        )),
              );
            },
            child: Text(
              "Today",
              style: GoogleFonts.acme(fontSize: 15, color: kredcolor),
            ),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35.0)),
                        border: Border.all(
                          color: kredcolor,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(
                                15.0)), // Half of the width/height to make the image circular
                          ),
                        ),
                      ),
                    ),

                    // CircleAvatar(

                    //   key: Key(selectedGender ?? ''),

                    //   maxRadius: 30,
                    //   minRadius: 30,
                    //   backgroundImage: AssetImage(
                    //     imagePath,
                    //   ), // Updated image path
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${getGreeting()} $name ..,",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                //   child: Container(
                //     child: Image.asset(
                //       "images/lo.png",
                //       width: 400,
                //       height: 400,
                //     ),
                //     width: 360,
                //     height: 200,
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     "How are you feeling today?",
                //     style: TextStyle(fontSize: 25),
                //   ),
                // ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: korangecolor),
                      height: 200,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "DAILY JOURNAL",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "How are you   \n feeling today?",
                              // style: TextStyle(fontSize: 25, color: Colors.white),
                              style: GoogleFonts.acme(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          Moodchecking(name: name)),
                                );
                              },
                              icon: const Icon(Icons.emoji_emotions),
                              label: const Text(
                                "Daily mood check-in",
                                style: TextStyle(color: kredcolor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: ,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 10),
                //       child:
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: Colors.brown)),
          //       height: 150,
          //       child: Column(
          //         children: [
          //           // Image.asset(
          //           //   "images/workout.jpeg",
          //           //   width: 130,
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          const Hompagecard(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: FloatingActionButton(
          backgroundColor: korangecolor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => Addhabits(
                      habitHistory: habitHistory,
                    )));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
