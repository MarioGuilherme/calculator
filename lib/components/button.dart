import "package:flutter/material.dart";

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool isBig;
  final Color color;
  final void Function(String) callBack;

  const Button({
    required this.text,
    required this.callBack,
    this.isBig = false,
    this.color = Button.DEFAULT,
    Key? key
  }) : super(key: key);

  const Button.big({
    required this.text,
    required this.callBack,
    this.isBig = true,
    this.color = Button.DEFAULT,
    Key? key
  }) : super(key: key);

  const Button.operation({
    required this.text,
    required this.callBack,
    this.isBig = false,
    this.color = Button.OPERATION,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.isBig ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: this.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          )
        ),
        onPressed: () => this.callBack(this.text),
        child: Text(
          this.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200
          )
        )
      )
    );
  }
}