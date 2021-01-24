import 'package:flutter/material.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      theme: ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
        tabBarTheme: TabBarTheme(labelColor: Colors.white),
        textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            // ignore: deprecated_member_use
            body1: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.white)),
        bottomAppBarColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
