import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Center(
        child: Text(
          "AutoKit",
          style: TextStyle(
            fontFamily: '맑은 고딕',
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
