import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import '../../edit_habits/yearheatmap.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import the Firestore package

class YearBase extends StatelessWidget {
  final DateTime selectedDate;
  final String habitId;
  final String? habitName;

  const YearBase({
    required this.selectedDate,
    required this.habitId,
    required List<Map<String, dynamic>> habitHistory,
    this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("2023"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('history')
              .where('habitId', isEqualTo: habitId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final habitHistory = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              final completionDate = data['completionDate'] as Timestamp?;
              if (completionDate != null) {
                data['completionDate'] = completionDate.toDate();
              }
              return data;
            }).toList();

            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kheight20,
                    Flexible(
                      child: buildHeatMapYear(
                          selectedDate, habitHistory, habitId, habitName!),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext, int index) => kheight20,
              itemCount: habitHistory.length,
            );
          },
        ),
      ),
    );
  }
}
