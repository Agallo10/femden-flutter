import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPress;

  const Boton({Key key, @required this.text, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      hoverElevation: 5,
      color: Color.fromRGBO(221, 203, 236, 1),
      shape: StadiumBorder(),
      onPressed: this.onPress,
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
