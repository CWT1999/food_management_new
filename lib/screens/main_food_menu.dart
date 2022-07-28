import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              backgroundColor: Colors.green,
              elevation: 0,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    "AutoKit",
                    style: TextStyle(
                        fontFamily: 'RobotoSlab', fontSize: 25, color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ],

      ),
    );
  }
}
