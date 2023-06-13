import 'package:flutter/material.dart';
import 'dart:math';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var _height;
  var _weight;
  var _rand = Random().nextInt(3) + 1;
  status(result) {
    if (result < 18) {
      return 'دچار کمبود وزن';
    } else if (result <= 24) {
      return '!تبریک،کاملا سالم';
    } else if (result < 29) {
      return 'دارای اضافه وزن';
    } else if (result > 30) {
      return "چاق";
    }
  }

  calculate(context) {
    var result = _height * _height;
    result = _weight / result;
    result = result * 10000;
    result = result.round();
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      value: result / 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("${status(result)}",
                        style: TextStyle(
                          fontFamily: "farsi",
                          fontSize: 30,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text('BMI:${result}',
                        style: TextStyle(
                          fontFamily: "farsi",
                          fontSize: 25,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'بستن',
                          style: TextStyle(
                              fontFamily: "farsi",
                              fontSize: 20,
                              color: Colors.red[300]),
                        ))
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Image.asset('asset/image/$_rand.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_height} cm',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'farsi',
                  ),
                ),
                Text(
                  'قد',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'farsi',
                  ),
                ),
              ],
            ),
          ),
          Slider(
            activeColor: Colors.green[300],
            value: (_height ?? 200).toDouble(),
            min: 0,
            max: 200,
            divisions: 200,
            onChanged: (value) => setState(() {
              _height = value.toInt();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_weight} kg',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'farsi',
                    ),
                  ),
                  Text(
                    'وزن',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'farsi',
                    ),
                  ),
                ]),
          ),
          Slider(
              activeColor: Colors.green[300],
              value: (_weight ?? 200).toDouble(),
              min: 0,
              max: 200,
              divisions: 200,
              onChanged: (value) => setState(() {
                    _weight = value.toInt();
                  })),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100.0, vertical: 3),
                child: ElevatedButton(
                  onPressed: () => calculate(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.calculate_rounded,
                          size: 40,
                        ),
                      ),
                      Text(
                        'محاسبه',
                        style: TextStyle(
                          fontFamily: "farsi",
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
