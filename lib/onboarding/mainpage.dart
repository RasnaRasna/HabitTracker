import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/login/sign.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        // Use the first value from the stream to get the initial user state
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // User is logged in
          if (snapshot.hasData) {
            final user = snapshot.data!;
            final userId = user.uid;

            return FutureBuilder<List<Map<String, dynamic>>>(
              future: getHabitHistory(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                // Successfully fetched the habit history data
                if (snapshot.hasData) {
                  final habitHistory = snapshot.data!;
                  return bottombar(
                    habitHistory: habitHistory,
                    startDate: DateTime.now(),
                  );
                } else {
                  // Error fetching habit history data
                  return const Center(
                    child: Text('Error fetching habit history data'),
                  );
                }
              },
            );
          }

          // User is NOT logged in
          return const SignPage();
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getHabitHistory(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('add_habits')
          .where('userId', isEqualTo: userId)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final completionDate = data['completionDate'] as Timestamp?;
        if (completionDate != null) {
          data['completionDate'] = completionDate.toDate();
        }
        return data;
      }).toList();
    } catch (e) {
      // Error handling if data fetching fails
      print('Error fetching habit history data: $e');
      return [];
    }
  }
}
