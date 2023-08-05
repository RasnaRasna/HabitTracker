import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckCircleIcon extends StatelessWidget {
  final String habitId;

  const CheckCircleIcon({required this.habitId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('add_habits')
          .doc(habitId)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a progress indicator while waiting for data
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          // Handle any errors that occur while fetching data
          return const Icon(
            Icons.check_circle,
            color: Colors.grey, // Set the default color to grey
          );
        }

        final habitData = snapshot.data?.data() as Map<String, dynamic>?;

        // Check if the habit is currently selected (defaults to false if data is null)
        final bool isSelected = habitData?['selected'] as bool? ?? false;

        // Return the Icon with the appropriate color based on isSelected
        return Icon(
          Icons.check_circle,
          color: isSelected ? Colors.red : Colors.grey,
        );
      },
    );
  }
}
