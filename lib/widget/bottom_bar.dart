import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, child: Container(
      height: 50,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(icon: Icon(
            Icons.home,
            size: 18,
          ),
            child: Text('Home', style: TextStyle(fontSize: 9),)
            ),
          Tab(icon: Icon(
            Icons.account_circle,
            size: 18,
          ),
              child: Text('Profile', style: TextStyle(fontSize: 9),)
          ),
          Tab(icon: Icon(
            Icons.fastfood_outlined,
            size: 18,
          ),
              child: Text('Food Menu', style: TextStyle(fontSize: 9),)
          ),
          Tab(icon: Icon(
            Icons.settings,
            size: 18,
          ),
              child: Text('More', style: TextStyle(fontSize: 9),)
          ),
        ],
      ),
    ),
    );
  }
}



