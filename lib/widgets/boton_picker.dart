import 'package:flutter/material.dart';

class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;
  final Color color;
  final Color colorTexto;

  const ButtonHeaderWidget({
    Key key,
    @required this.title,
    @required this.text,
    @required this.onClicked,
    this.color,
    this.colorTexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ButtonWidget(
        color: color,
        colorTexto: colorTexto,
        text: text,
        onClicked: onClicked,
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;
  final Color colorTexto;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
    this.color,
    this.colorTexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(2),
            backgroundColor: MaterialStateProperty.all<Color>(this.color),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: this.colorTexto),
          ),
        ),
        onPressed: onClicked,
      );
}
