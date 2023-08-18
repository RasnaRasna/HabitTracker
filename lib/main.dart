import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habits_track/Firebase/notification_service.dart';
import 'package:habits_track/bottom_pages/Today/completion.dart';
import 'package:habits_track/edit_habits/edit_habits.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:habits_track/provider/buttonclickedstate.dart';
import 'package:habits_track/provider/check_cirlebothpage.dart';
import 'package:habits_track/provider/habitcomplition.dart';
import 'package:habits_track/provider/notesand_iconcolors.dart';
import 'package:habits_track/provider/genderprovider.dart';
import 'package:habits_track/provider/selectDateprovider.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:provider/provider.dart';

import 'bottom_pages/challenges/savebuttonstate.dart';
import 'onboarding/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await initFcm();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  tz.initializeTimeZones();
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
        ChangeNotifierProvider(create: (_) => SelectedDaysProvider()),
        ChangeNotifierProvider(
          create: (_) => HabitCompletionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChallengeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => CompletedCountProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: AuthPage(),
      ),
    );
  }
}
