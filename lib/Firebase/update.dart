import 'package:cloud_firestore/cloud_firestore.dart';

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
