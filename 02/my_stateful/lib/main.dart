import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

//Once you have define all the states you call them here
class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

//You define all the states in this method
class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];
  List<String> englishNumbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
  String english = "In English";
  String defaultText = "Spanish Numbers";

  void displaySNumbers() {
    // whenever you want to change anything you will cal this method

    setState(() {
      defaultText = spanishNumbers[counter];
      english = englishNumbers[counter];
      if (counter < 9) {
        counter = counter + 1;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext countext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Stateful App"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(defaultText, style: TextStyle(fontSize: 35.0)),
            Text(english, style: TextStyle(fontSize: 20.0)),
            Padding(padding: EdgeInsets.all(10.0)),
            RaisedButton(
              child: Text(
                'Call Numbers',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: displaySNumbers,
              color: Colors.orange,
            )
          ],
        ),
      )),
    );
  }
}
