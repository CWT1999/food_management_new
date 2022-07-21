import 'package:flutter/cupertino.dart';
import 'package:food_management/widget/bottom_bar.dart';
import '../widget/top_bar.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

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
