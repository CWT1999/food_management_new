import 'package:flutter/material.dart';

class JoinOrLogin extends ChangeNotifier{ //로그인 페이지 상태가 로그인 상태인지 회원가입 상태인지 확인
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle(){
    _isJoin = !_isJoin;
    notifyListeners(); // ChangeNotifier을 통해서 제공된 데이터를 위젯들한테 알림을 보내줌
  }

}