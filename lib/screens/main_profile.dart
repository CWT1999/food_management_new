import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/top_bar.dart';

class MainProfile extends StatefulWidget {
  @override
  State<MainProfile> createState() => _MainProfile();
}

class _MainProfile extends State<MainProfile> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(

          children: [

            TopBar(),
          ],
        )
      ],
    );
  }
}
