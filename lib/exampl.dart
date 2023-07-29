
// class MyHomePageToday extends StatelessWidget {
//   final String? documentId;

//   MyHomePageToday({Key? key, this.documentId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final buttonProvider = Provider.of<MyButtonClickedProvider>(context);
//     final selectedDayProvider = Provider.of<SelectedDayProvider>(context);

//     if (DateTime.now().hour == 0 && DateTime.now().minute == 0) {
//       buttonProvider.resetHabitSelections();
//       selectedDayProvider.selectCurrentDay();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (ctx) => const bottombar()),
//             );
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         centerTitle: true,
//         title: const Text(
//           " Today",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(
//         children: [
//           kheight50,
//           Expanded(
//             child: Consumer<SelectedDayProvider>(
//               builder: (context, selectedDayProvider, _) {
//                 return buildListViewSeparated(
//                   selectedDayProvider,
//                   buttonProvider,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getDaySymbol(int index) {
//     final List<String> symbols = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
//     return symbols[index];
//   }

//   Widget buildListViewSeparated(
//     SelectedDayProvider selectedDayProvider,
//     MyButtonClickedProvider buttonProvider,
//   ) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       // User is not authenticated
//       return const Center(
//         child: Text(
//           'User not authenticated',
//           style: TextStyle(fontSize: 25),
//         ),
//       );
//     }

//     final userId = currentUser.uid;

//     return Consumer<MyButtonClickedProvider>(
//       builder: (context, buttonProvider, _) {
//         return StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('add_habits')
//               .where('userId', isEqualTo: userId)
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Text(
//                   'No habits available',
//                   style: TextStyle(fontSize: 25),
//                 ),
//               );
//             }
//             final habitItems = snapshot.data!.docs;

//             return ListView.separated(
//               itemBuilder: (BuildContext context, int index) {
//                 final habitData = snapshot.data!.docs[index];
//                 final habitId = habitData.id;
//                 final habitName = habitData['name'] as String?;
//                 final daysPerWeek = habitData['daysPerWeek'] as int?;
//                 final startDate =
//                     (habitData['startDate'] as Timestamp?)?.toDate();

//                 int completedCount = 0; // TODO: Get the actual completed count

//                 List<Widget> daySymbols = [];
//                 final currentDayIndex = DateTime.now().weekday - 1;
//                 final selectedDayIndex =
//                     buttonProvider.getSelectedDayIndex(habitId) ?? -1;

//                 for (int i = 0; i < 7; i++) {
//                   final backgroundColor = i == selectedDayIndex &&
//                           buttonProvider.isHabitSelected(habitId)
//                       ? Colors.pink.shade200
//                       : Colors.white;
//                   final textColor =
//                       i <= currentDayIndex ? Colors.pink : Colors.black;

//                   daySymbols.add(
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 3),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: backgroundColor,
//                           border: Border.all(width: 1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         width: 20,
//                         height: 22,
//                         child: Center(
//                           child: Text(
//                             _getDaySymbol(i),
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: textColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }

//                 return SizedBox(
//                   height: 125,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Card(
//                       child: GestureDetector(
//                         onTap: () => Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (ctx) => EditHabits(
//                               documentId: habitData.id,
//                               habitName: habitName,
//                               daysPerWeek: daysPerWeek,
//                               startDate: startDate,
//                               selectedDate: startDate,
//                             ),
//                           ),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: const Color.fromARGB(255, 150, 147, 147),
//                               width: 1,
//                             ),
//                           ),
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: 20,
//                                 left: 10,
//                                 child: Text(
//                                   '🔥 $completedCount',
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               kheight10,
//                               Positioned(
//                                 top: 60,
//                                 left: 10,
//                                 child: Text(
//                                   habitName ?? 'Unknown Habit',
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 5,
//                                   horizontal: 10,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         ...daySymbols,
//                                         KWidth7,
//                                         IconButton(
//                                           onPressed: () {
//                                             if (buttonProvider
//                                                 .isHabitSelected(habitId)) {
//                                               buttonProvider
//                                                   .toggleHabitSelection(
//                                                       habitId);
//                                               buttonProvider.setSelectedDayIndex(
//                                                   habitId,
//                                                   -1); // Reset the selected day index for the habit
//                                             } else {
//                                               buttonProvider
//                                                   .toggleHabitSelection(
//                                                       habitId);
//                                               buttonProvider
//                                                   .setSelectedDayIndex(
//                                                       habitId, currentDayIndex);
//                                             }
//                                           },
//                                           icon: Icon(
//                                             Icons.check_circle,
//                                             color: buttonProvider
//                                                     .isHabitSelected(habitId)
//                                                 ? Colors.pink
//                                                     .shade200 // Set the color when selected
//                                                 : Colors
//                                                     .grey, // Set the default color
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 30,
//                                         vertical: 10,
//                                       ),
//                                       child: Text(
//                                         '0/$daysPerWeek',
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return const SizedBox(height: 10);
//               },
//               itemCount: habitItems.length,
//             );
//           },
//         );
//       },
//     );
//   }
// }
// class History e  xtends StatefulWidget {
//   final DateTime selectedDate;
//   final String habitId; // Add the habitId as a parameter

//   const History({
//     Key? key,
//     required this.selectedDate,
//     required this.habitId,
//   }) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   late List<bool> showAdditionalButtonList;
//   late List<Map<String, dynamic>> habitHistory;

//   @override
//   void initState() {
//     super.initState();
//     showAdditionalButtonList =
//         List<bool>.generate(_getDaysCount(), (_) => false);
//     // Initialize the habitHistory list with default values for each day
//     habitHistory = List.generate(
//         _getDaysCount(),
//         (_) => {
//               'isSelected': false,
//               'notes': '',
//             });
//   }

//   final CollectionReference historyCollection =
//       FirebaseFirestore.instance.collection('history');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("History & Notes"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: historyCollection
//             .where('habitId', isEqualTo: widget.habitId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//           // Map the habit history data from Firestore
//           habitHistory = snapshot.data!.docs
//               .map((doc) => doc.data() as Map<String, dynamic>)
//               .toList();

//           // Fill the habitHistory list with default values for any missing days
//           for (int i = habitHistory.length; i < _getDaysCount(); i++) {
//             habitHistory.add({
//               'isSelected': false,
//               'notes': '',
//             });
//           }
//           print('hanitid:${widget.habitId}}');
//           return ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _getDaysCount(),
//                 separatorBuilder: (context, index) => const SizedBox(height: 8),
//                 itemBuilder: (context, index) {
//                   final currentDate = widget.selectedDate
//                       .add(Duration(days: _getDaysCount() - 1 - index));
//                   final habitData = habitHistory[index];

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ListTile(
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: const Color.fromARGB(255, 221, 221, 221),
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       title: Text(_getFormattedDate(currentDate)),
//                       subtitle: Text(habitData['notes'] ?? ''),

//                       // Display the notes for the day

//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           if (Provider.of<IconColorchangeprovider>(context)
//                               .isAdditionalButtonVisible(index))
//                             IconButton(
//                               onPressed: () {
//                                 _showMyDialog(index);
//                               },
//                               icon: const Icon(Icons.message),
//                             ),
//                           Consumer<IconColorchangeprovider>(
//                             builder: (context, iconColorchangeprovider, _) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   iconColorchangeprovider.updateColor(index);
//                                   // Toggle the isSelected value
//                                   setState(() {
//                                     habitHistory[index]['isSelected'] =
//                                         !habitHistory[index]['isSelected'];
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: iconColorchangeprovider
//                                           .isAdditionalButtonVisible(index)
//                                       ? Color.fromARGB(255, 229, 113, 151)
//                                       : Colors.grey,
//                                 ),
//                               );
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }

//   int _getDaysCount() {
//     final difference = DateTime.now().difference(widget.selectedDate).inDays;
//     return difference.abs() + 1;
//   }

//   String _getFormattedDate(DateTime date) {
//     final formatter = DateFormat('dd-MMM-yyyy (EEEE)');
//     return formatter.format(date);
//   }

//   Future<void> _showMyDialog(int index) async {
//     String notes = '';
//     await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Enter your notes'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Container(
//                   width: 250,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadiusDirectional.circular(10.0),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: TextField(
//                     onChanged: (value) {
//                       notes = value;
//                     },
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   child: const Text('Cancel'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('Save'),
//                   onPressed: () async {
//                     final habitId = widget.habitId;
//                     final currentDate = widget.selectedDate
//                         .add(Duration(days: _getDaysCount() - 1 - index));
//                     final isSelected = habitHistory[index]['isSelected'];
//                     final timestamp = Timestamp.now();
//                     final documentId =
//                         "$habitId-${currentDate.toIso8601String()}";

//                     // Save the notes to the "history" collection with the specified document ID
//                     await historyCollection.doc(documentId).set({
//                       "habitId": habitId,
//                       "isSelected": isSelected,
//                       "notes": notes,
//                       "selectedDayIndex": index,
//                       "timestamp": timestamp,
//                     });

//                     setState(() {
//                       habitHistory[index]['notes'] = notes;
//                       habitHistory[index]['isSelected'] =
//                           isSelected; // Update the local isSelected value
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class History extends StatefulWidget {
//   final DateTime selectedDate;
//   final String habitId; // Add the habitId as a parameter

//   const History({
//     Key? key,
//     required this.selectedDate,
//     required this.habitId,
//   }) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   late List<Map<String, dynamic>> habitHistory;

//   final CollectionReference historyCollection =
//       FirebaseFirestore.instance.collection('history');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("History & Notes"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: historyCollection
//             .where('habitId', isEqualTo: widget.habitId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           // Map the habit history data from Firestore
//           habitHistory = snapshot.data!.docs
//               .map((doc) => doc.data() as Map<String, dynamic>)
//               .toList();

//           // Fill the habitHistory list with default values for any missing days
//           for (int i = habitHistory.length; i < _getDaysCount(); i++) {
//             habitHistory.add({
//               'isSelected': false,
//               'notes': '',
//             });
//           }

//           return Consumer<IconColorchangeprovider>(
//             builder: (context, iconColorchangeprovider, _) {
//               return ListView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _getDaysCount(),
//                     separatorBuilder: (context, index) =>
//                         const SizedBox(height: 8),
//                     itemBuilder: (context, index) {
//                       final currentDate = widget.selectedDate
//                           .add(Duration(days: _getDaysCount() - 1 - index));
//                       final habitData = habitHistory.firstWhere((data) {
//                         final selectedDayIndex = data['selectedDayIndex'];
//                         if (selectedDayIndex != null) {
//                           final selectedDate = widget.selectedDate
//                               .add(Duration(days: selectedDayIndex));
//                           return selectedDate == currentDate;
//                         }
//                         return false;
//                       }, orElse: () => {'isSelected': false, 'notes': ''});

//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: const Color.fromARGB(255, 221, 221, 221),
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           title: Text(_getFormattedDate(currentDate)),
//                           subtitle: Text(habitData['notes'] ?? ''),

//                           // Display the notes for the day

//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               if (iconColorchangeprovider
//                                   .isAdditionalButtonVisible(
//                                       widget.habitId, index))
//                                 IconButton(
//                                   onPressed: () {
//                                     _showMyDialog(index);
//                                   },
//                                   icon: const Icon(Icons.message),
//                                 ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     habitHistory[index]['isSelected'] =
//                                         !habitHistory[index]['isSelected'];

//                                     // Toggle the additional button visibility when the check_circle icon is tapped
//                                     Provider.of<IconColorchangeprovider>(
//                                       context,
//                                       listen: false,
//                                     ).toggleAdditionalButtonVisibility(
//                                         widget.habitId, index);
//                                   });

//                                   final habitId = widget.habitId;
//                                   final currentDate = widget.selectedDate.add(
//                                       Duration(
//                                           days: _getDaysCount() - 1 - index));
//                                   final isSelected =
//                                       habitHistory[index]['isSelected'];
//                                   final documentId =
//                                       "$habitId-${currentDate.toIso8601String()}";

//                                   // Save the isSelected state to the "history" collection with the specified document ID
//                                   historyCollection.doc(documentId).set({
//                                     "habitId": habitId,
//                                     "isSelected": isSelected,
//                                     "selectedDayIndex": index,
//                                     "timestamp": Timestamp.now(),
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: Provider.of<IconColorchangeprovider>(
//                                               context)
//                                           .isAdditionalButtonVisible(
//                                               widget.habitId, index)
//                                       ? Color.fromARGB(255, 229, 113, 151)
//                                       : habitHistory[index]['isSelected'] ??
//                                               false
//                                           ? Color.fromARGB(255, 229, 113, 151)
//                                           : Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   int _getDaysCount() {
//     final difference = DateTime.now().difference(widget.selectedDate).inDays;
//     return difference.abs() + 1;
//   }

//   String _getFormattedDate(DateTime date) {
//     final formatter = DateFormat('dd-MMM-yyyy (EEEE)');
//     return formatter.format(date);
//   }

//   Future<void> _showMyDialog(int index) async {
//     String notes = '';
//     await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Enter your notes'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Container(
//                   width: 250,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: TextField(
//                     onChanged: (value) {
//                       notes = value;
//                     },
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   child: const Text('Cancel'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('Save'),
//                   onPressed: () async {
//                     final habitId = widget.habitId;
//                     final currentDate = widget.selectedDate
//                         .add(Duration(days: _getDaysCount() - 1 - index));
//                     final isSelected = !habitHistory[index]['isSelected'];
//                     final timestamp = Timestamp.now();
//                     final selectedDayIndex = _getDaysCount() -
//                         1 -
//                         index; // Calculate the selectedDayIndex

//                     final documentId =
//                         "$habitId-${currentDate.toIso8601String()}";

//                     // Save the notes to the "history" collection with the specified document ID
//                     await historyCollection.doc(documentId).set({
//                       "habitId": habitId,
//                       "isSelected": isSelected,
//                       "notes": notes,
//                       "selectedDayIndex":
//                           selectedDayIndex, // Store the selectedDayIndex
//                       "timestamp": timestamp,
//                     });

//                     // Update the local isSelected value and notes in the habitHistory list for the correct date
//                     setState(() {
//                       habitHistory[index]['notes'] = notes;
//                     });

//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }




//unclick on histry 
// GestureDetector(
//   onTap: () {
//     setState(() {
//       // Toggle the isSelected value when the check_circle icon is tapped
//       habitHistory[index]['isSelected'] =
//           !habitHistory[index]['isSelected'];

//       // Toggle the additional button visibility when the check_circle icon is tapped
//       Provider.of<IconColorchangeprovider>(
//         context,
//         listen: false,
//       ).toggleAdditionalButtonVisibility(widget.habitId, index);
//     });
//   },
//   child: Icon(
//     Icons.check_circle,
//     color: Provider.of<IconColorchangeprovider>(context).isAdditionalButtonVisible(
//           widget.habitId,
//           index,
//         )
//         ? Color.fromARGB(255, 229, 113, 151)
//         : habitHistory[index]['isSelected']
//             ? Color.fromARGB(255, 229, 113, 151)
//             : Colors.grey,
//   ),
// )


// class History extends StatefulWidget {
//   final DateTime selectedDate;
//   final String habitId; // Add the habitId as a parameter

//   const History({
//     Key? key,
//     required this.selectedDate,
//     required this.habitId,
//   }) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   late List<Map<String, dynamic>> habitHistory;
//   List<bool> isNotesAdded = List.generate(
//       31, (index) => false); // Track if notes are added for each day

//   final CollectionReference historyCollection =
//       FirebaseFirestore.instance.collection('history');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("History & Notes"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: historyCollection
//             .where('habitId', isEqualTo: widget.habitId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           habitHistory = snapshot.data!.docs
//               .map((doc) => doc.data() as Map<String, dynamic>)
//               .toList();

//           for (int i = habitHistory.length; i < _getDaysCount(); i++) {
//             habitHistory.add({
//               'isSelected': false,
//               'notes': '',
//             });
//           }

//           return Consumer<IconColorchangeprovider>(
//             builder: (context, iconColorchangeprovider, _) {
//               return ListView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _getDaysCount(),
//                     separatorBuilder: (context, index) =>
//                         const SizedBox(height: 8),
//                     itemBuilder: (context, index) {
//                       final currentDate =
//                           widget.selectedDate.add(Duration(days: index));
//                       final habitData = habitHistory.firstWhere(
//                         (data) {
//                           final selectedDayIndex = data['selectedDayIndex'];
//                           if (selectedDayIndex != null) {
//                             final selectedDate = widget.selectedDate
//                                 .add(Duration(days: selectedDayIndex));
//                             return selectedDate == currentDate;
//                           }
//                           return false;
//                         },
//                         orElse: () => {'isSelected': false, 'notes': ''},
//                       );

//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: const Color.fromARGB(255, 221, 221, 221),
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           title: Text(_getFormattedDate(currentDate)),
//                           subtitle: Text(habitData['notes'] ?? ''),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               if (iconColorchangeprovider
//                                   .isAdditionalButtonVisible(
//                                       widget.habitId, index))
//                                 IconButton(
//                                   onPressed: () {
//                                     _showMyDialog(index);
//                                   },
//                                   icon: const Icon(Icons.message),
//                                 ),
//                               GestureDetector(
//                                 onTap: () async {
//                                   await _handleCheckCircle(
//                                       index); // Call the _handleCheckCircle function

//                                   setState(() {
//                                     if (habitData['isSelected']) {
//                                       // If the day is checked and the user wants to uncheck
//                                       _showUncheckConfirmationDialog(index);
//                                     } else {
//                                       // If the day is unchecked, toggle the isSelected state immediately
//                                       habitData['isSelected'] = true;
//                                       Provider.of<IconColorchangeprovider>(
//                                               context,
//                                               listen: false)
//                                           .toggleAdditionalButtonVisibility(
//                                               widget.habitId, index);
//                                     }
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: Provider.of<IconColorchangeprovider>(
//                                               context)
//                                           .isAdditionalButtonVisible(
//                                               widget.habitId, index)
//                                       ? Color.fromARGB(255, 229, 113, 151)
//                                       : habitData['isSelected']
//                                           ? Color.fromARGB(255, 229, 113, 151)
//                                           : Colors.grey,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   int _getDaysCount() {
//     final difference = DateTime.now().difference(widget.selectedDate).inDays;
//     return difference.abs() + 1;
//   }

//   String _getFormattedDate(DateTime date) {
//     final formatter = DateFormat('dd-MMM-yyyy (EEEE)');
//     return formatter.format(date);
//   }

//   Future<void> _showMyDialog(int index) async {
//     String notes = habitHistory[index]['notes'];
//     final habitData = habitHistory[index]; // Define habitData here

//     await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setStateInsideDialog) {
//             return AlertDialog(
//               title: const Text('Enter your notes'),
//               content: SingleChildScrollView(
//                 child: ListBody(
//                   children: <Widget>[
//                     Container(
//                       width: 250,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(color: Colors.grey),
//                       ),
//                       child: TextField(
//                         onChanged: (value) {
//                           setStateInsideDialog(() {
//                             notes = value;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       child: const Text('Cancel'),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     TextButton(
//                       child: const Text('Save'),
//                       onPressed: () async {
//                         final habitId = widget.habitId;
//                         final currentDate =
//                             widget.selectedDate.add(Duration(days: index));
//                         final isSelected = !habitHistory[index]['isSelected'];
//                         final timestamp = Timestamp.now();
//                         final selectedDayIndex =
//                             index; // Use the provided index directly

//                         final documentId =
//                             "$habitId-${currentDate.toIso8601String()}";

//                         // Append the new notes to the existing notes
//                         final newNotes =
//                             "${habitHistory[index]['notes']}  $notes";

//                         // Save the notes to the "history" collection with the specified document ID
//                         await historyCollection.doc(documentId).set({
//                           "habitId": habitId,
//                           "isSelected": isSelected,
//                           "notes":
//                               newNotes, // Use the newNotes instead of notes
//                           "selectedDayIndex": selectedDayIndex,
//                           "timestamp": timestamp,
//                         });

//                         // Update the local notes in the habitHistory list for the correct date
//                         habitHistory[index]['notes'] = newNotes;
//                         habitHistory[index]['isSelected'] = isSelected;
//                         isNotesAdded[index] =
//                             true; // Mark notes as added for this day

//                         // Close the notes dialog
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   Future<void> _handleCheckCircle(int index) async {
//     final currentDate = widget.selectedDate.add(Duration(days: index));
//     final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";
//     final habitData = habitHistory[index];
//     final isSelected = !habitData['isSelected'];

//     if (isSelected == false && habitData['notes'].isNotEmpty) {
//       // Show the confirmation dialog only if the day is unchecked and notes are entered
//       final shouldUncheck = await _showUncheckConfirmationDialog(index);
//       if (!shouldUncheck) {
//         return; // If the user cancels the uncheck, do not proceed further
//       }
//     }

//     try {
//       final docSnapshot = await historyCollection.doc(documentId).get();
//       if (docSnapshot.exists) {
//         // If the document exists, update the isSelected field
//         await historyCollection.doc(documentId).update({
//           "isSelected": isSelected,
//         });
//       } else {
//         // If the document doesn't exist, create a new one in Firestore
//         final timestamp = Timestamp.now();
//         final selectedDayIndex = index;

//         await historyCollection.doc(documentId).set({
//           "habitId": widget.habitId,
//           "isSelected": isSelected,
//           "notes": "", // Initialize notes as an empty string (optional step)
//           "selectedDayIndex": selectedDayIndex,
//           "timestamp": timestamp,
//         });
//       }

//       // Update the local isSelected value immediately to reflect the user's interaction
//       setState(() {
//         habitData['isSelected'] = isSelected;
//       });
//     } catch (e) {
//       print("Error updating document: $e");
//     }
//   }

//   Future<bool> _showUncheckConfirmationDialog(int index) async {
//     final result = await showDialog<bool>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Notes and Completion?'),
//           content: const Text(
//               'Are you sure you want to delete the notes and reset the completion for this day?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('No'),
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//             ),
//             TextButton(
//               child: const Text('Yes'),
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//             ),
//           ],
//         );
//       },
//     );
//     if (result == true) {
//       await _resetNotesAndCompletion(index);
//     }
//     return result ?? false;
//   }

//   Future<void> _resetNotesAndCompletion(int index) async {
//     final currentDate = widget.selectedDate.add(Duration(days: index));
//     final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";

//     try {
//       await historyCollection.doc(documentId).delete();

//       setState(() {
//         habitHistory[index]['isSelected'] = false;
//         habitHistory[index]['notes'] = '';
//         isNotesAdded[index] = false; // Mark notes as not added for this day
//       });

//       // Reset additional button visibility state in the IconColorchangeprovider
//       Provider.of<IconColorchangeprovider>(context, listen: false)
//           .resetAdditionalButtonVisibility(widget.habitId, index);
//     } catch (e) {
//       print("Error deleting document: $e");
//     }
//   }

// reset have some issue





//  this is the history page in here user mark on the completion status ok
// you can see here if user mark on the colpletion status by click on the check_circle button it will store to  fire base with true state and also the message iconbutton also visible that is optional if user want to add notes add, like that if the user cunmark the cmpletion if will change to default color and state ,and also the message button also not showing that is also correct the number 1:  after unclick the check_circle the color and the state  isnot resetting  fastly its it taking delay and next 2: if mark on comletion corectly measn up to down direction withou skipping any date it will change the state correctly ok? i will say the example if i select the date on july  25 ok then history is like 25,to 29 right if i mark on 25 next26,next27 and etc that is working correctly,but if i mark on  first  under the start date eg: 26,or 27 or etc the click on the iconstate  is changing correctly at the same time other iconstate also changing without clicking only color ok in firebase correctly working and next issue 3: if mark the completion it will store to firestore and also seeing ui ok then i restart the app that time the message button not visible i think we manged that is not correct i think we need to add that also in firestore ok i will share the provider code of manage the message icon ok,and also insted of this 31 List<bool> isNotesAdded = List.generate(
//       31, (index) => false); give the correct count based on user mark on the start date to current date right each tile want message want right   i hope you understood my explanation we can solve stepby step right