import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_management/data/join_or_login.dart';
import 'package:food_management/screens/login.dart';
import 'package:food_management/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.data == null) {
          return ChangeNotifierProvider<JoinOrLogin>.value(
              value: JoinOrLogin(),
              child: AuthPage());
        }else{
          return  MainPage(email:snapshot.data.toString());
        }
      }
    );
  }
}
