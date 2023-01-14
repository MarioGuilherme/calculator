import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:calculator/components/display.dart";
import "package:calculator/components/keyboard.dart";
import "package:calculator/models/memory.dart";

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  void _onPressed(String   command) {
    setState(() => this.memory.applyCommand(command));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp
      ]
    );

    return MaterialApp(
      title: "Cod3r Calc",
      debugShowCheckedModeBanner: false,
      home: Column(
        children: <Widget>[
          Display(this.memory.value),
          Keyboard(this._onPressed)
        ]
      )
    );
  }
}