import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/discover/discover.dart';
import 'package:habits_track/bottom_pages/month/month.dart';
import 'package:habits_track/bottom_pages/year/year.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "month",
              baseStyle: TextStyle(),
              selectedStyle: TextStyle()),
          MonthBase()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "year", baseStyle: TextStyle(), selectedStyle: TextStyle()),
          YearBase()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "disc", baseStyle: TextStyle(), selectedStyle: TextStyle()),
          Discover()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.pinkAccent,
      initPositionSelected: 0,
    );
  }
}
