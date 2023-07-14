import 'package:flutter/material.dart';
import 'package:foodshood/favourite.dart';
import 'package:foodshood/home_page.dart';
import 'package:foodshood/profile_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final myTextStyle = TextStyle(fontSize: 18, color: Colors.white);

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "HomePage",
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle),
          HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "ProfilePage",
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle),
          ProfilePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "FavouritePage",
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle),
          FavouritePage())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      disableAppBarDefault: true,
      backgroundColorMenu: Color.fromARGB(250, 250, 74, 13),
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
