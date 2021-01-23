import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SignupPage.dart';
import 'SigninPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//First put android JSON file in android and iOS
//use gradle in android
//do same for iOS
//ymal for flutter

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Login",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SigninPage(),
      routes: <String, WidgetBuilder>{
        '/SigninPage': (BuildContext context) => SigninPage(),
        '/SignupPage': (BuildContext context) => SignupPage(),
      },
    );
  }
}
