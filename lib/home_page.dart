import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 237, 237, 237),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: const Color.fromARGB(237, 237, 237, 237),
        domeCircleColor: Color.fromARGB(250, 250, 74, 13),
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(Icons.home),
          ),
          MoltenTab(
            icon: const Icon(Icons.favorite),
          ),
          MoltenTab(
            icon: const Icon(Icons.person),
          ),
          MoltenTab(
            icon: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
