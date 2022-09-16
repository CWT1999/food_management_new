import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/join_or_login.dart';
import 'package:food_management/helper/login_background.dart';
import 'package:provider/provider.dart';
import 'forget_pw.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //로그인 form에 key를 지정
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //context에 앱이 가지고 있는 정보들을 가지고 있다

    final Size size = MediaQuery
        .of(context)
        .size; //핸드폰에 사이즈를 가져오는 것

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(
                isJoin: Provider
                    .of<JoinOrLogin>(context)
                    .isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size), //로그인 이메일 쪽과 패스워드와 비밀번호를 까먹으셨나요
                  _authButton(size), //로그인 버튼
                  // Container(width: 100, height: 50, color: Colors.black,)
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Consumer<JoinOrLogin>(
                builder: (context, joinOrLogin, child) =>
                    InkWell(
                        onTap: () {
                          joinOrLogin.toggle();
                        },
                        child: Text(
                          joinOrLogin.isJoin ? "로그인화면으로 이동할게요" : "회원가입",
                          style: TextStyle(
                              color: joinOrLogin.isJoin ? Colors.red : Colors
                                  .blue),
                        )),
              ),
              Container(
                height: size.height * 0.05,
              )
            ],
          )
        ],
      ),
    );
  }

  void _register(BuildContext context) async {
    //개정생성기능
    final UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    final FirebaseAuth user = result.user as FirebaseAuth;

    if (user == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please try again late')));
    }
  }
  //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  //페이지 이동 코드
  void _login(BuildContext context) async {
    //로그인
    final UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
    final FirebaseAuth user = result.user as FirebaseAuth;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }
  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          // 로그인 폼 모양에 테두리 모서리부분을 둥글게 하는 기능
            borderRadius: BorderRadius.circular(16)),
        elevation: 6, //그림자를 넣어줌
        child: Padding(
          padding:
          const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              //_formKey가 밑에 TextFormField에서 작성한 아이디와 패스워드에 변화를 이어주는 통로라고 생각해주면된다
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //controller로 만들어줘야지 나중에 가지고 올수가 있다
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "맞는 이메일을 입력해주세요";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true, //패스워드 입력시 *로 표시해주는 기능
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "맞는 패스워드를 입력해주세요";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (context, value, child) =>
                        Opacity(
                            opacity: value.isJoin ? 0 : 1, //opacity는 투명한정도
                            child: GestureDetector(
                                onTap:value.isJoin?null:(){goToForgetPw(context);},
                                child: Text("비밀번호를 까먹으셨나요??"))),
                  ),
                ],
              )),
        ),
      ),
    );


  }

  goToForgetPw(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPw()));
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.1,
      right: size.width * 0.1,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Consumer<JoinOrLogin>(
          builder: (context, joinOrLogin, child) =>
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    joinOrLogin.isJoin?_register(context):_login(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  joinOrLogin.isJoin ? "회원가입" : "로그인",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
        ),
      ),
    );
  }

  Widget get _logoImage {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 23, right: 23),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/food1.jpg"),
          ),
        ),
      ),
    );
  }
}
