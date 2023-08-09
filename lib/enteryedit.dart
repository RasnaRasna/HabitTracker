// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class EditNoteScreen extends StatefulWidget {
//   final String question;
//   final String initialNote;
//   final CollectionReference collection;
//   final String docId;
//   final int index;

//   EditNoteScreen({
//     required this.question,
//     required this.initialNote,
//     required this.collection,
//     required this.docId,
//     required this.index,
//   });

//   @override
//   _EditNoteScreenState createState() => _EditNoteScreenState();
// }

// class _EditNoteScreenState extends State<EditNoteScreen> {
//   late String editedNote;

//   @override
//   void initState() {
//     super.initState();
//     editedNote = widget.initialNote;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Note"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Text(widget.question),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: TextField(
//               onChanged: (text) {
//                 setState(() {
//                   editedNote = text;
//                 });
//               },
//               controller: TextEditingController(text: editedNote),
//               decoration: InputDecoration(
//                 hintText: "Edit your answer",
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: ElevatedButton(
//               onPressed: () async {
//                 await widget.collection.doc(widget.docId).update({
//                   "note": editedNote,
//                 });

//                 // Update the notes list and go back to the previous screen
//                 setState(() {
//                   // _updateNotes(widget.index, editedNote);
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text("Save"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // void _updateNotes(int index, String editedNote) {
//   //   setState(() {
//   //     _EnteryState.notes[index]["note"] = editedNote;
//   //   });
//   // }
// }
