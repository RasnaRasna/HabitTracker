// Container habitTemplatesContainer(
//     List<String> habitTemplates, Function(String) onHabitSelected) {
//   return Container(
//     height: 40,
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//       children: habitTemplates.map((habit) {
//         return GestureDetector(
//           onTap: () {
//             onHabitSelected(habit);
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               border: Border.all(color: Color.fromARGB(255, 229, 113, 151)),
//             ),
//             width: 130,
//             child: Center(
//               child: Text(
//                 habit,
//                 style: TextStyle(fontSize: 18, color: Colors.black),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     ),
//   );
// }


  // StreamBuilder(
  //           stream: HabitsTemplates.snapshots(),
  //           builder: (BuildContext context, AsyncSnapshot snapshot) {
  //             if (snapshot.hasData) {
  //               return SizedBox(
  //                 height: 300,
  //                 child: ListView.builder(
  //                   itemBuilder: (context, index) {
  //                     final DocumentSnapshot templatsnap =
  //                         snapshot.data.docs[index];
  //                     final templateData = templatsnap.data();
  //                     final templateName = templateData != null &&
  //                             (templateData as Map)
  //                                 .containsKey("habit Templates")
  //                         ? templateData["habit Templates"]
  //                         : '';
  //                     return Text(templateName);
  //                   },
  //                   itemCount: snapshot.data.docs.length,
  //                 ),
  //               );
  //             }
  //             return Container();
  //           },
  //         )