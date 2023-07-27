import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../bottom_pages/bottom_bar.dart';
import '../provider/genderprovider.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User is not authenticated
      return const Center(
        child: Text(
          'User not authenticated',
          style: TextStyle(fontSize: 25),
        ),
      );
    }

    final userId = currentUser.uid;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Nice to Meet You",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 70,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: TextField(
                  onChanged: (value) =>
                      Provider.of<GenderProvider>(context, listen: false)
                          .setName(value),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    hintText: "What is your name?",
                    prefixIcon: Icon(Icons.person),
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Create the life you love 🖤",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                children: [
                  Consumer<GenderProvider>(
                    builder: (context, genderProvider, _) => GestureDetector(
                      onTap: () {
                        final selectedGender = genderProvider.selectedGender;
                        genderProvider.setGender(
                          selectedGender == "Male" ? null : "Male",
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: genderProvider.selectedGender == "Male"
                                ? Colors.pink.shade100
                                : Colors.grey,
                          ),
                          color: genderProvider.selectedGender == "Male"
                              ? Colors.pink.shade100
                              : Colors.transparent,
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Male',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Consumer<GenderProvider>(
                    builder: (context, genderProvider, _) => GestureDetector(
                      onTap: () {
                        final selectedGender = genderProvider.selectedGender;
                        genderProvider.setGender(
                          selectedGender == "Female" ? null : "Female",
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: genderProvider.selectedGender == "Female"
                                ? Colors.pink.shade100
                                : Colors.grey,
                          ),
                          color: genderProvider.selectedGender == "Female"
                              ? Colors.pink.shade100
                              : Colors.transparent,
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Female',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    final genderProvider =
                        Provider.of<GenderProvider>(context, listen: false);
                    final selectedGender = genderProvider.selectedGender;
                    final name = genderProvider.name;

                    if (name.isNotEmpty && selectedGender != null) {
                      final snapshot = await FirebaseFirestore.instance
                          .collection('add_habits')
                          .where('userId', isEqualTo: userId)
                          .get();

                      if (snapshot.docs.isEmpty) {
                        // If no data in 'add_habits', proceed without waiting
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => bottombar(
                              selectedGender: selectedGender,
                              name: name,
                              habitHistory: [],
                              startDate: DateTime.now(),
                              habitId: '',
                              habitName: '',
                            ),
                          ),
                          (route) => false,
                        );
                      } else {
                        // If data is available, wait for stream data
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('add_habits')
                                  .where('userId', isEqualTo: userId)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  print(
                                      'Error fetching data: ${snapshot.error}');
                                  // Handle any errors that occur while fetching data
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  print('No data available yet.');
                                  // Handle case when no habits are available
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                // Retrieve habitData and other relevant information from the snapshot
                                final habitData = snapshot.data!.docs[0];
                                final habitId = habitData.id;
                                final habitName = habitData['name'] as String?;
                                print(
                                    'Received habitName startpage: ${habitName}');
                                print('Received id startpage: ${habitId}');

                                // Retrieve habitHistory data from the snapshot
                                final habitHistory =
                                    snapshot.data!.docs.map((doc) {
                                  final data =
                                      doc.data() as Map<String, dynamic>;
                                  final completionDate =
                                      data['completionDate'] as Timestamp?;
                                  if (completionDate != null) {
                                    data['completionDate'] =
                                        completionDate.toDate();
                                  }
                                  return data;
                                }).toList();
                                print(habitHistory);
                                return bottombar(
                                  selectedGender: selectedGender,
                                  name: name,
                                  habitHistory: habitHistory,
                                  startDate: DateTime.now(),
                                  habitId: habitId,
                                  habitName: habitName,
                                );
                              },
                            ),
                          ),
                          (route) => false,
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Alert"),
                            content: Text(
                                "Please enter your name and select a gender."),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
