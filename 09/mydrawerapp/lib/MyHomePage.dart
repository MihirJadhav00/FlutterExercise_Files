import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Mihir Jadhav"),
              accountEmail: Text("jadhavmihir143@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Text("MJ"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.category),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            Divider(),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.mobile_friendly),
              // onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(title: Text("LogIn"), trailing: Icon(Icons.login)
                // onTap: () => Navigator.of(context).pushNamed("/a"),
                ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Home Page")],
        ),
      ),
    );
  }
}
