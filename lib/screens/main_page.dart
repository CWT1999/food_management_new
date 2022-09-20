import 'package:flutter/material.dart';
import 'package:food_management/screens/main_food_menu2.dart';
import 'package:food_management/screens/main_home.dart';
import 'package:food_management/screens/main_profile.dart';
import '../widget/bottom_bar.dart';
import 'main_home.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AutoKit",
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.lightGreenAccent),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              MainHome(),
              MainProfile(),
              MainFoodMenu2(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}