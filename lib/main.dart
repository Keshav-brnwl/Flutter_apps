import 'package:calculator/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 40.0, color: Colors.white),
                        ),
                        Text(
                          answer.toString(),
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onpress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onpress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: Colors.orange,
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onpress: () {
                            userInput += '7';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onpress: () {
                            userInput += '8';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onpress: () {
                            userInput += '9';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '*',
                          color: Colors.orange,
                          onpress: () {
                            userInput += '*';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onpress: () {
                            userInput += '4';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onpress: () {
                            userInput += '5';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onpress: () {
                            userInput += '6';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: Colors.orange,
                          onpress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onpress: () {
                            userInput += '1';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onpress: () {
                            userInput += '2';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onpress: () {
                            userInput += '3';
                            equalPress();
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: Colors.orange,
                          onpress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onpress: () {
                            if (userInput.isNotEmpty) {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              // equalPress();
                              setState(() {});
                            }
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: Colors.orange,
                          onpress: () {
                            equalPress();

                            setState(() {
                              userInput = answer;
                              answer = '';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
