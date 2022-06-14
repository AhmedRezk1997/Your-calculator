import 'package:calc_app/btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _hist = "";
  String _expr = "";

  void numpress(String text) {
    setState(() {
      _expr += text;
    });
  }

  void clearall(String text) {
    setState(() {
      _expr = "";
      _hist = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expr = "";
      _hist = "";
    });
  }

  void calculate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expr);
    ContextModel cm = ContextModel();

    setState(() {
      _hist = _expr;
      _expr = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[200],
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _hist,
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expr,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Btnpress(
                    text: "*",
                    fillColor: Colors.teal[500],
                    textSize: 24,
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "/",
                    fillColor: Colors.teal[500],
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "-",
                    fillColor: Colors.teal[500],
                    textSize: 38,
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "+",
                    fillColor: Colors.teal[500],
                    textSize: 30,
                    callback: numpress,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Btnpress(
                    text: "%",
                    fillColor: Colors.teal[500],
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "9",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "8",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "7",
                    callback: numpress,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Btnpress(
                    text: "AC",
                    fillColor: Colors.teal[500],
                    textSize: 20,
                    callback: clearall,
                  ),
                  Btnpress(
                    text: "6",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "5",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "4",
                    callback: numpress,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Btnpress(
                    text: "C",
                    fillColor: Colors.teal[500],
                    callback: clear,
                  ),
                  Btnpress(
                    text: "3",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "2",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "1",
                    callback: numpress,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Btnpress(
                    text: "=",
                    fillColor: Colors.teal[500],
                    callback: calculate,
                  ),
                  Btnpress(
                    text: ".",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "0",
                    callback: numpress,
                  ),
                  Btnpress(
                    text: "00",
                    callback: numpress,
                    textSize: 26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
