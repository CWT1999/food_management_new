import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/screens/main_home_edit.dart';
import 'package:food_management/screens/main_food_menu2.dart';
import 'package:food_management/screens/main_home.dart';
import 'package:food_management/screens/main_profile.dart';


import '../widget/bottom_bar.dart';
import 'main_food_menu.dart';
import 'main_home.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({required this.email});
  String email;

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
