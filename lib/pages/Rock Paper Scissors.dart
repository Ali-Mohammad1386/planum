import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var playerA = 'sang.png';
  var playerB = 'scissors.png';
  Render() {
    var a = Random().nextInt(3) + 1;
    var b = Random().nextInt(3) + 1;
    switch (a) {
      case 1:
        playerA = 'scissors.png';
        break;
      case 2:
        playerA = 'sang.png';
        break;
      case 3:
        playerA = 'paper.png';
        break;
    }
    switch (b) {
      case 1:
        playerB = 'scissors.png';
        break;
      case 2:
        playerB = 'sang.png';
        break;
      case 3:
        playerB = 'paper.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(200, 99, 10, 190),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "  قیچی",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'farsi', fontSize: 23),
            ),
            Text(
              "  کاغذ",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'farsi', fontSize: 23),
            ),
            Text(
              "  سنگ",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'farsi', fontSize: 23),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(250, 231, 192, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "asset/image/$playerA",
              width: 160,
            ),
            SizedBox(
              height: 35,
            ),
            TextButton(
                onPressed: () => setState(() => Render()),
                child: Text(
                  "شروع",
                  style: TextStyle(
                    fontFamily: 'farsi',
                    fontSize: 30,
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "asset/image/$playerB",
              width: 160,
            )
          ],
        ),
      ),
    );
  }
}
