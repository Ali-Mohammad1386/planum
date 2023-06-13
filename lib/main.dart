import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_horizontal_date_picker/persian_horizontal_date_picker.dart';
import 'pages/bmi.dart';
import 'pages/Dice.dart';
import 'pages/tec tac toe.dart';
import 'pages/Rock Paper Scissors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),
    routes: {
      '/bmi': (context) => Bmi(),
      '/Dice': (context) => Dice(),
      '/TecTac': (context) => TecTac(),
      '/Rock-Paper-Scissors': (context) => Game(),
    },
  ));
}

class todo {
  String? title;
  int? work;
  String? time;
  var color;
  todo(title, work, time) {
    this.title = title;
    this.work = work;
    this.time = time;
  }
  changestate() {
    if (time == 'check-none') {
      time = 'check2-square';
      color = Colors.green;
    } else {
      time = 'check-none';
      color = Colors.black;
    }
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentPageIndex = 2;
  var profile = 1;
  var _formkey = GlobalKey<FormState>();
  var _title;
  var _work;
  var _time = 'check-none';
  var works = [];
  var _name = 'نام کاربری';
  todoes() {
    if (works.length != 0) {
      return ListView.builder(
          itemCount: works.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      works[index].changestate();
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    "asset/image/${works[index].time}.svg",
                                    height: 27,
                                    color: works[index].color,
                                  )),
                            ),
                            InkWell(
                                child: SvgPicture.asset("asset/image/bin.svg",
                                    height: 33),
                                onTap: () => setState(() {
                                      works.removeAt(index.toInt());
                                    })),
                          ],
                        ),
                        Text(
                          "${works[index].title}",
                          style: TextStyle(fontFamily: 'farsi', fontSize: 23),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                              "asset/image/'${works[index].work}'.png",
                              width: 125),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      return Center(
        child: Text(
          "🙁 .مورد تازه ای یافت نشد",
          style:
              TextStyle(fontFamily: 'farsi', fontSize: 30, color: Colors.black),
        ),
      );
    }
  }

  task() {
    if (works.length == 0) {
      return Text(
        '.تسک جدیدی یافت نشد',
        style: TextStyle(fontFamily: 'farsi', fontSize: 20),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("!تسک فعال یافت شد",
              style: TextStyle(fontFamily: 'farsi', fontSize: 20)),
          Text("${works.length}",
              style: TextStyle(fontFamily: 'farsi', fontSize: 20))
        ],
      );
    }
  }

  void popup() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            profile = index + 1;
                          });
                        },
                        child: Image.asset(
                          "asset/image/(${index + 1}).jpg",
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  showAbout(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/image/ali.jpg'),
                        radius: 75,
                      ),
                    ),
                    Text("👋!دوست خوبم سلام",
                        style: TextStyle(fontFamily: 'farsi', fontSize: 25)),
                    Text(
                        "من علی محمد اسماعیلی هستم؛یک فرد علاقه مند به برنامه نویسی ،متولد86/7/9 ",
                        style: TextStyle(fontFamily: 'farsi', fontSize: 25)),
                  ],
                ),
              ),
              shadowColor: Colors.black,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(
                  "asset/image/setting.svg",
                  height: 26,
                ),
                label: "",
                selectedIcon: SvgPicture.asset(
                  "asset/image/setting-fill.svg",
                  color: Colors.green,
                  height: 30,
                )),
            NavigationDestination(
                icon: SvgPicture.asset(
                  "asset/image/calendar4.svg",
                  height: 22,
                ),
                label: "",
                selectedIcon: SvgPicture.asset(
                  "asset/image/calendar.svg",
                  color: Colors.green,
                  height: 22,
                )),
            NavigationDestination(
              icon: SvgPicture.asset(
                "asset/image/house.svg",
                height: 25,
              ),
              label: "",
              selectedIcon: SvgPicture.asset(
                "asset/image/house-fill.svg",
                color: Colors.green,
                height: 25,
              ),
            )
          ]),
      body: <Widget>[
        Container(
            child: SafeArea(
          child: NavigationDrawer(children: [
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Badge(
                  largeSize: 30,
                  padding: EdgeInsets.all(0),
                  alignment: AlignmentDirectional.bottomCenter,
                  backgroundColor: Colors.green,
                  label: ElevatedButton(
                    onPressed: () => popup(),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("asset/image/($profile).jpg"),
                    radius: 75,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        _name = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: '$_name',
                        hintStyle: TextStyle(
                          fontFamily: "farsi",
                          fontSize: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, color: Colors.white))),
                  ),
                )
              ],
            ),
            Divider(color: Colors.grey[400]),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                child: Text('✌👨‍💻درباره من',
                    style: TextStyle(
                      fontFamily: 'farsi',
                      fontSize: 20,
                      color: Colors.white,
                    )),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                ),
                onPressed: () => showAbout(context),
              ),
            ),
          ]),
        )),
        Container(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("فعالیت های امروز",
                        style: TextStyle(
                            fontFamily: 'farsi',
                            fontSize: 24,
                            color: Colors.black)),
                  ],
                )),
            body: todoes(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Form(
                                        key: _formkey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "👇 عنوان برنامه",
                                                  style: TextStyle(
                                                      fontFamily: 'farsi',
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                            TextField(
                                              onChanged: (val) => _title = val,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text("👇 نوع برنامه ",
                                                    style: TextStyle(
                                                        fontFamily: 'farsi',
                                                        fontSize: 22)),
                                              ],
                                            ),
                                            ListTile(
                                              title: Text("کلاس زبان",
                                                  style: TextStyle(
                                                      fontFamily: 'farsi',
                                                      fontSize: 20)),
                                              leading: Radio(
                                                fillColor:
                                                    MaterialStatePropertyAll<
                                                        Color>(Colors.green),
                                                value: 1,
                                                groupValue: _work,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _work = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            ListTile(
                                                title: Text("خرید",
                                                    style: TextStyle(
                                                        fontFamily: 'farsi',
                                                        fontSize: 20)),
                                                leading: Radio(
                                                    value: 3,
                                                    groupValue: _work,
                                                    fillColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            Colors.green),
                                                    onChanged: (val) =>
                                                        setState(() {
                                                          _work = val;
                                                        }))),
                                            ListTile(
                                                title: Text("استراحت،تفریح",
                                                    style: TextStyle(
                                                        fontFamily: 'farsi',
                                                        fontSize: 20)),
                                                leading: Radio(
                                                    value: 4,
                                                    groupValue: _work,
                                                    fillColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            Colors.green),
                                                    onChanged: (val) =>
                                                        setState(() {
                                                          _work = val;
                                                        }))),
                                            ListTile(
                                                title: Text("انجام دادن تکالیف",
                                                    style: TextStyle(
                                                        fontFamily: 'farsi',
                                                        fontSize: 20)),
                                                leading: Radio(
                                                    value: 5,
                                                    groupValue: _work,
                                                    fillColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            Colors.green),
                                                    onChanged: (val) =>
                                                        setState(() {
                                                          _work = val;
                                                        }))),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(
                                                          context,
                                                          rootNavigator: true)
                                                      .pop(),
                                                  child: Text(
                                                    "بیخیال",
                                                    style: TextStyle(
                                                        fontFamily: 'farsi',
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_title != null) {
                                                          works.add(todo(_title,
                                                              _work, _time));
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                          _title = null;
                                                          _work = null;
                                                          _time = 'check-none';
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  "🙄 .عنوان برنامه نمیتوند خالی باشد",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'farsi',
                                                                    fontSize:
                                                                        15,
                                                                  )),
                                                              action:
                                                                  SnackBarAction(
                                                                      label:
                                                                          "حله",
                                                                      onPressed:
                                                                          () {}),
                                                            ),
                                                          );
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                        }
                                                      });
                                                    },
                                                    child: Text("حله",
                                                        style: TextStyle(
                                                            fontFamily: "farsi",
                                                            fontSize: 20,
                                                            color:
                                                                Colors.green))),
                                              ],
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ));
                });
              },
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Colors.green,
            ),
          ),
        ),
        Container(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("👋 ", style: TextStyle(fontSize: 23)),
                      Text(
                        _name,
                        style: TextStyle(
                            fontFamily: 'farsi',
                            fontSize: 22,
                            color: Color.fromARGB(255, 106, 200, 176)),
                      ),
                      Text(" ،سلام",
                          style: TextStyle(
                              fontFamily: 'farsi',
                              fontSize: 25,
                              color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("asset/image/($profile).jpg"),
                          radius: 40,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: PersianHorizontalDatePicker(
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(const Duration(days: 30)),
                      initialSelectedDate: DateTime.now(),
                      onDateSelected: (date) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 25),
                            child: task(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "♥ سلامت",
                          style: TextStyle(fontFamily: 'farsi', fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(context, '/bmi'),
                              child: Container(
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 30),
                                color: Colors.amber,
                                child: Text(
                                  "BMI",
                                  style: TextStyle(
                                      fontFamily: 'farsi',
                                      fontSize: 30,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "🎮 سرگرمی ",
                          style: TextStyle(
                              fontFamily: 'farsi',
                              fontSize: 28,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/TecTac'),
                              child: Container(
                                  color: Color.fromARGB(200, 27, 235, 177),
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    "asset/image/tectac.png",
                                    height: 150,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, "/Dice"),
                              child: Container(
                                color: Colors.orange,
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  "🎲",
                                  style: TextStyle(
                                      fontFamily: 'farsi',
                                      fontSize: 50,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, "/Rock-Paper-Scissors"),
                              child: Container(
                                  color: Color.fromARGB(200, 254, 66, 73),
                                  height: 100,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Image.asset(
                                    "asset/image/scissors.png",
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
