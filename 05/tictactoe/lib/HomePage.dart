import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: link up images
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  //TODO: intialize the state of box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //TODO: playGame method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //TODO: Reset Game method
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //TODO: get image method

  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;
      case ("circle"):
        return circle;
        break;
      case ("cross"):
        return cross;
        break;
    }
  }

  //TODO: check for win logic
  checkWin() {
    //Win Condition for 1st Row
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }

    //Win Condition for 2nd Row
    else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }

    //Win Condition for 3rd Row
    else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Win Condition for 1st Column

    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Win Condition for 2nd Column

    else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Win Condition for 3rd Column

    else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Win Condition for 1st Diag..

    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Win Condition for 2st Diag..

    else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
    //Condition for draw
    else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        Timer(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //If you want to use the grid view than you need to use expanede widget.
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
              color: Colors.purple,
              minWidth: 300.0,
              height: 60.0,
              child: Text(
                "Reset Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                this.resetGame();
              }),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "mihirjadhav04",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
