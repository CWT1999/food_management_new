import 'package:flutter/material.dart';
import 'package:food_management/data/join_or_login.dart';

class LoginBackground extends CustomPainter{

  LoginBackground({required this.isJoin});

  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) { //여기에 백그라운드 그림 삽입
    Paint paint = Paint()..color = isJoin?Colors.red:Colors.blue; //Paint()부터 blue까지 한값으로 보라(Paint에 color값을 blue로 잡고 paint에 넣어준다)
    canvas.drawCircle(Offset(size.width*0.5, size.height*0.2), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) { // 움지이는 그림이 있으면 그거에 맞춰서 계속 다시 백그라운드 그림을 그려주냐?
    return false; //아니요
  }

}