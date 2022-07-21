import 'package:flutter/cupertino.dart';
import 'package:food_management/widget/bottom_bar.dart';
import '../widget/top_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
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
