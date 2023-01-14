import "package:flutter/material.dart";

import "package:calculator/components/button.dart";

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow(
    this.buttons,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: this.buttons.fold(<Widget>[], (acc, button) {
          acc.isEmpty ? acc.add(button) : acc.addAll(<Widget>[const SizedBox(width: 1), button]);
          return acc;
        })
      )
    );
  }
}