import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> AddHabitData(
    {required String selectedHabit,
    required int selectedDaysPerWeek,
    required DateTime selectedDate,
    required BuildContext context}) async {
  try {
    // Retrieve the current user ID
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    // Check if the selectedHabit is empty or null
    if (selectedHabit == null || selectedHabit!.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please enter a valid habit name'),
        ),
      );
      return;
    }

    // Check if selectedDaysPerWeek is a valid value
    if (selectedDaysPerWeek < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please select the number of days per week'),
        ),
      );
      return;
    }

    // All validation checks passed, add the habit data to the database
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('add_habits')
        .where('name', isEqualTo: selectedHabit)
        .where('userId', isEqualTo: userId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Habit already exists'),
        ),
      );
    } else {
      await FirebaseFirestore.instance.collection('add_habits').add({
        'name': selectedHabit,
        'daysPerWeek': selectedDaysPerWeek + 1,
        'startDate': Timestamp.fromDate(selectedDate!),
        'userId': userId,
        // Store the user ID with the habit data
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Habit added successfully'),
        ),
      );
    }
  } catch (e) {
    print('Error saving habit data: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to save habit'),
      ),
    );
  }
}
