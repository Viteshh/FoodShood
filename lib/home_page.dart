import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodshood/food_items.dart';
import 'package:foodshood/hidden_drawer.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 237, 237, 237),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: const Color.fromARGB(237, 237, 237, 237),
        domeCircleColor: const Color.fromARGB(250, 250, 74, 13),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      SimpleHiddenDrawerController.of(context).toggle(),
                  icon: const Icon(Icons.menu),
                  iconSize: 25,
                  color: const Color.fromARGB(255, 143, 143, 143),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  iconSize: 25,
                  color: const Color.fromARGB(255, 143, 143, 143),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text("Delicious Food For You",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              //   onChanged: (value){
              //  searchData(st = value.trim().toLowerCase());
              //    // Method For Searching
              //              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(250, 250, 74, 13))),
                hoverColor: const Color.fromARGB(250, 250, 74, 13),
                hintText: "Search",
                fillColor: const Color.fromARGB(235, 210, 210, 210),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(250, 250, 74, 13),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
              top: 20,
            ),
            child: TabBar(
              isScrollable: true,
              controller: tabController, // Set the TabController
              indicatorColor: const Color.fromARGB(250, 250, 74, 13),
              unselectedLabelColor: const Color.fromARGB(255, 176, 176, 176),

              labelColor: const Color.fromARGB(250, 250, 74, 13),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  child: Text(
                    "Foods",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Drinks",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Snacks",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sauce",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            FoodTab(),
            const Text("Drinks"),
            const Text("Snacks"),
            const Text("Sauce"),
          ]))
        ],
      ),
    );
  }
}
