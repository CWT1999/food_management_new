import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Autokit",
              style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 25,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
}
}
