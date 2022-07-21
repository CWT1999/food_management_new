import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_management/widget/bottom_bar.dart';
import '../widget/top_bar.dart';

class MainMore extends StatefulWidget {
  const MainMore({Key? key}) : super(key: key);

  @override
  State<MainMore> createState() => _MainMore();
}

class _MainMore extends State<MainMore> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        TopBar(),
        Container(
          child: ElevatedButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, child: Text("Logout")),
        ),
      ],
    ),
  );
}
}
