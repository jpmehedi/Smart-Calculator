import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smart Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String oparend = " ";

  buttonPresed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      oparend = " ";
    } else if (buttonText == "/" ||
        buttonText == "*" ||
        buttonText == "-" ||
        buttonText == "+") {
      num1 = double.parse(output);
      oparend = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print('Already Contain a Decimal');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (oparend == "+") {
        _output = (num1 + num2).toString();
      }
      if (oparend == "-") {
        _output = (num1 - num2).toString();
      }
      if (oparend == "*") {
        _output = (num1 * num2).toString();
      }
      if (oparend == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      oparend = " ";
    } else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String btnSymbol) {
    return Expanded(
      child: OutlineButton(
        highlightElevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        onPressed: () {
          buttonPresed(btnSymbol);
        },
        child: Text(
          '$btnSymbol',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.blueGrey,
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
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 100.0,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38.00,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
