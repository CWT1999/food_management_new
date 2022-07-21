import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  const ForgetPw({Key? key}) : super(key: key);

  @override
  State<ForgetPw> createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
              final snacBar = SnackBar(
                content: Text('Check yout email for pw reset '),
              );
              ScaffoldMessenger.of(context).showSnackBar(snacBar);
            }, child: Text('Reset Password'), ),
          ],
        ),
      ),
    );
  }
}
