import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first, second;
  String opp;
  String result, text = "";
  void btnClicked(String btnText) {
    if (btnText == "C") {
      print("case 1");
      first = 0;
      second = 0;
      result = "";
      text = "";
      ///////////////
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "X" ||
        btnText == "/") {
      print("case 2");
      first = int.parse(text);
      result = "";
      opp = btnText;
      ////////////////
    } else if (btnText == "=") {
      print("case 3");
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      } else if (opp == "-") {
        result = (first - second).toString();
      } else if (opp == "X") {
        result = (first * second).toString();
      } else if (opp == "/") {
        result = (first ~/ second).toString();
      }
      ///////////////
    } else {
      print("case 4");
      result = int.parse(text + btnText).toString();
    }
    ////////////////
    setState(() {
      text = result;
    });
  }

  Widget customOutlineButton(String value) {
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnClicked(value),
        padding: EdgeInsets.all(25),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.yellow,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )),
            Row(
              children: <Widget>[
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("4"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
