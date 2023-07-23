import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/login/sign.dart';
import 'package:habits_track/provider/buttonclickedstate.dart';
import 'package:habits_track/provider/monthbase.dart';
import 'package:habits_track/provider/notesand_iconcolors.dart';
import 'package:habits_track/provider/genderprovider.dart';
import 'package:habits_track/provider/selectDateprovider.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:provider/provider.dart';

import 'bottom_pages/month/month.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IconColorchangeprovider()),
        ChangeNotifierProvider(
          create: (context) => SelectedDayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClickedStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyButtonClickedProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GenderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HabitCompletionProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: SignPage(),
      ),
    );
  }
}
