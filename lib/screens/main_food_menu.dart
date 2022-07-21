import 'package:flutter/cupertino.dart';
import 'package:food_management/widget/bottom_bar.dart';
import '../widget/top_bar.dart';

class MainFoodMenu extends StatefulWidget {
  const MainFoodMenu({Key? key}) : super(key: key);

  @override
  State<MainFoodMenu> createState() => _MainFoodMenuState();
}

class _MainFoodMenuState extends State<MainFoodMenu> {
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
