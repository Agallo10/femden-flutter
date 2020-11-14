import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Boton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      hoverElevation: 5,
      color: Color.fromRGBO(221, 203, 236, 1),
      shape: StadiumBorder(),
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
