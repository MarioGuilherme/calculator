import "package:flutter/material.dart";

import "package:calculator/components/button.dart";
import "package:calculator/components/button_row.dart";

class Keyboard extends StatelessWidget {
  final void Function(String) callBack;

  const Keyboard(
    this.callBack,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .75,
      child: Column(
        children: <Widget>[
          ButtonRow(
            <Button>[
              Button.big(text: "AC", color: Button.DARK, callBack: callBack),
              Button(text: "%", color: Button.DARK, callBack: callBack),
              Button.operation(text: "/", callBack: callBack)
            ]
          ),
          const SizedBox(height: 1),
          ButtonRow(
            <Button>[
              Button(text: "7", callBack: callBack),
              Button(text: "8", callBack: callBack),
              Button(text: "9", callBack: callBack),
              Button.operation(text: "x", callBack: callBack)
            ]
          ),
          const SizedBox(height: 1),
          ButtonRow(
            <Button>[
              Button(text: "4", callBack: callBack),
              Button(text: "5", callBack: callBack),
              Button(text: "6", callBack: callBack),
              Button.operation(text: "-", callBack: callBack)
            ]
          ),
          const SizedBox(height: 1),
          ButtonRow(
            <Button>[
              Button(text: "1", callBack: callBack),
              Button(text: "2", callBack: callBack),
              Button(text: "3", callBack: callBack),
              Button.operation(text: "+", callBack: callBack)
            ]
          ),
          const SizedBox(height: 1),
          ButtonRow(
            <Button>[
              Button.big(text: "0", callBack: callBack),
              Button(text: ",", callBack: callBack),
              Button.operation(text: "=", callBack: callBack)
            ]
          )
        ]
      )
    );
  }
}