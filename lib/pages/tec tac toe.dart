import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class TecTac extends StatefulWidget {
  const TecTac({super.key});

  @override
  State<TecTac> createState() => _TecTacState();
}

class _TecTacState extends State<TecTac> {
  var turn = 1;

  var text = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  var boolcan = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  winner1() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("× برنده ",
                  style: TextStyle(fontFamily: 'farsi', fontSize: 35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () => setState(() {
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                      child: Text(
                        "حله",
                        style: TextStyle(fontFamily: 'farsi', fontSize: 25,color: Colors.green),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  winner2() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("⬤ برنده ",
                  style: TextStyle(fontFamily: 'farsi', fontSize: 35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () => setState(() {
                        Navigator.of(context, rootNavigator: true).pop();
                      }),
                      child: Text(
                        "حله",
                        style: TextStyle(fontFamily: 'farsi', fontSize: 25,color:Colors.green),
                      ),
                     
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Render(i, context) {
    if (boolcan[i] == true) {
      if (turn == 1) {
        text[i] = 1;
        boolcan[i] = false;
        turn = 2;
      } else {
        text[i] = 2;
        boolcan[i] = false;
        turn = 1;
      }
    } else {}

    if (text[1] & text[2] & text[3] == 1) {
      winner1();
    } else if (text[1] & text[2] & text[3] == 2) {
      winner2();
    } else if (text[4] & text[5] & text[6] == 1) {
      winner1();
    } else if (text[4] & text[5] & text[6] == 2) {
      winner2();
    } else if (text[7] & text[8] & text[9] == 1) {
      winner1();
    } else if (text[7] & text[8] & text[9] == 2) {
      winner2();
    } else if (text[1] & text[4] & text[7] == 1) {
      winner1();
    } else if (text[1] & text[4] & text[7] == 2) {
      winner2();
    } else if (text[2] & text[5] & text[8] == 1) {
      winner1();
    } else if (text[2] & text[5] & text[8] == 2) {
      winner2();
    } else if (text[3] & text[6] & text[9] == 1) {
      winner1();
    } else if (text[3] & text[6] & text[9] == 2) {
      winner2();
    } else if (text[3] & text[5] & text[7] == 1) {
      winner1();
    } else if (text[3] & text[5] & text[7] == 2) {
      winner2();
    } else if (text[1] & text[5] & text[9] == 1) {
      winner1();
    } else if (text[1] & text[5] & text[9] == 2) {
      winner2();
    } else {}
  }

  Render_svg(i) {
    if (text[i] != 0) {
      return SvgPicture.asset("asset/image/${text[i]}.svg");
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "دوز",
              style: TextStyle(
                fontFamily: 'farsi',
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(1, context)),
                    child: Container(
                      child: Render_svg(1),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(2, context)),
                    child: Container(
                      child: Render_svg(2),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(3, context)),
                    child: Container(
                      child: Render_svg(3),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(4, context)),
                    child: Container(
                      child: Render_svg(4),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(5, context)),
                    child: Container(
                      child: Render_svg(5),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(6, context)),
                    child: Container(
                      child: Render_svg(6),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(7, context)),
                    child: Container(
                      child: Render_svg(7),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(8, context)),
                    child: Container(
                      child: Render_svg(8),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    onTap: () => setState(() => Render(9, context)),
                    child: Container(
                      child: Render_svg(9),
                      color: Colors.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
