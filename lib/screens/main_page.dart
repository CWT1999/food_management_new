import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_management/screens/main_home.dart';
import 'package:food_management/screens/main_profile.dart';
import 'package:food_management/widget/top_bar.dart';

import '../widget/bottom_bar.dart';
import 'main_food_menu.dart';
import 'main_more.dart';

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
      title: 'Autokit',
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.lightGreenAccent),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              MainHome(),
              MainProfile(),
              MainFoodMenu(),
              MainMore(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}



// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title : Text("메인화면"),
//     ),
//     body: Column(
//       children: [
//         Container(
//           child: ElevatedButton(onPressed: (){
//             FirebaseAuth.instance.signOut();
//
//           }, child: Text("Logout")),
//         ),
//       ],
//     ),
//   );
// }
