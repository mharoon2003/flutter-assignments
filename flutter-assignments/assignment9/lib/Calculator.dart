//simple calculator that adds tow numbers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = '';

  void calculateSum() {
    setState(() {
      try {
        double num1 = double.parse(num1Controller.text);
        double num2 = double.parse(num2Controller.text);
        result = 'Result: ${num1 + num2}';
      } catch (e) {
        result = 'Error: Please enter valid numbers';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Center(
          child:
          Text(
              'Simple Calculator'
          )
      ),
      backgroundColor: Colors.amber,),

      body: Container(
        padding: EdgeInsets.all(9.0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.tealAccent,
        child:
        Column(
          children: [

            Expanded(
              child:
              Center(
                child:
                TextField(
                  textAlign: TextAlign.center,
                  controller: num1Controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Number 1'),
                ),
              ),
            ),
            Expanded(
              child:
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Number 2'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: calculateSum,
                child: Text('Calculate'),
              ),
            ),

            Container(
              color: Colors.green,
              width: 200,
                height: 100,
              child: // Space between button and result text
            Text(result),
            ),
          ],
        ),
      ),
    );
  }
}
