import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.yellowAccent, accentColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
        ),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('I Love YouTube!!'),
              Text('I Love To Make Videos!!'),
              RaisedButton(
                onPressed: () {},
                child: Text("SignUp"),
                color: Colors.yellow,
                splashColor: Colors.red,
              )
            ],
          ),
          // child: Text("I Love YouTube!!"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo,
          ),
        ),
      ),
    );
  }
}
