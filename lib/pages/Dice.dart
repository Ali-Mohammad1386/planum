import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  Roll_Dice() {
    switch (Random().nextInt(6) + 1) {
      case 1:
        return '⚀';
      case 2:
        return '⚁';
      case 3:
        return '⚂';
      case 4:
        return '⚃';
      case 5:
        return '⚄';
      case 6:
        return '⚅';
      default:
    }
  }
  var Dice='⚅';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("تاس",style: TextStyle(fontFamily: 'farsi',fontSize: 25),)
          ],
        ),
        backgroundColor: Colors.white,
         elevation: 0,
         foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Dice,
              style: TextStyle(fontFamily: 'farsi', fontSize: 150),
            ),
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () => setState(() {
                        Dice= Roll_Dice();
                      }),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: Text(
                      "تاس بنداز",
                      style: TextStyle(fontFamily: 'farsi', fontSize: 22),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
