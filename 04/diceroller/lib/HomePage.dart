import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage diceImage1;
  AssetImage diceImage2;

  @override
  void initState() {
    super.initState();
    //Whenever you want to change anything, then set state needs to be called.
    setState(() {
      diceImage1 = one;
      diceImage2 = three;
    });
  }

  void rollDice() {
    int random1 = (1 + Random().nextInt(6));
    int random2 = (1 + Random().nextInt(6));

    AssetImage newImage1;
    AssetImage newImage2;

    switch (random1) {
      case 1:
        newImage1 = one;
        break;
      case 2:
        newImage1 = two;
        break;
      case 3:
        newImage1 = three;
        break;
      case 4:
        newImage1 = four;
        break;
      case 5:
        newImage1 = five;
        break;
      case 6:
        newImage1 = six;
        break;
    }
    switch (random2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }
    setState(() {
      diceImage1 = newImage1;
      diceImage2 = newImage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: diceImage1,
                width: 150.0,
                height: 150.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
              ),
              Image(
                image: diceImage2,
                width: 150.0,
                height: 150.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text("Roll the dice!"),
                  onPressed: rollDice,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
