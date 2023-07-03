import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:foodshood/userCredentials/login.dart';
import 'package:foodshood/userCredentials/signup.dart';

class Credentials extends StatefulWidget {
  const Credentials({super.key});

  @override
  _CredentialsState createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 237, 237, 237),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/image/Group 3.png",
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          TabBar(
            controller: _tabController, // Set the TabController
            indicatorColor: Color.fromARGB(250, 250, 74, 13),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                text: "SignIn",
              ),
              Tab(
                text: "SignUp",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, // Set the TabController
              children: const [
                Login(),
                SignUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
