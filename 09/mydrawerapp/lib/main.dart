import 'package:flutter/material.dart';
import 'package:mydrawerapp/Category.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Category(),
      },
    );
  }
}

//Your Routing should always be present in main.dart .That's the raseon you should always keep your main.dart file short as much as possible and move every possible thing into another file.
