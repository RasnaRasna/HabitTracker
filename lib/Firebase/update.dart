import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference habitsTemplates =
    FirebaseFirestore.instance.collection("HabitsTemplates");
final CollectionReference addhabits =
    FirebaseFirestore.instance.collection("add_habits");

Future<bool> updateHabitData(
    String documentId, selectedHabit, selectedDaysPerWeek, selectedDate) async {
  try {
    await addhabits.doc(documentId).update({
      'name': selectedHabit,
      'daysPerWeek': selectedDaysPerWeek + 1,
      'startDate': Timestamp.fromDate(selectedDate!),
    });
    return true; // Success
  } catch (e) {
    print('Error updating habit data: $e');
    return false; // Error
  }
}

Future<bool> deleteHabit(String documentId) async {
  try {
    // Get the habit data to retrieve the habit ID
    final habitSnapshot = await addhabits.doc(documentId).get();
    final habitData = habitSnapshot.data() as Map<String, dynamic>;

    // Delete the habit
    await addhabits.doc(documentId).delete();

    // Delete the associated history
    final historySnapshot = await FirebaseFirestore.instance
        .collection('history')
        .where('habitId',
            isEqualTo: documentId) // Use the documentId directly as the habitId
        .get();

    // Delete each history document one by one
    for (final doc in historySnapshot.docs) {
      await doc.reference.delete();
    }

    return true; // Success
  } catch (e) {
    print('Error deleting habit: $e');
    return false; // Error
  }
}
