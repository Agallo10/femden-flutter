import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color colorTexto;

  const Boton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color,
      this.colorTexto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          backgroundColor: MaterialStateProperty.all<Color>(this.color),
          shape: MaterialStateProperty.all(StadiumBorder())),
      //elevation: 2,
      //hoverElevation: 5,
      //color: this.color,
      //shape: StadiumBorder(),
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(
            //style: TextStyle(color: this.colorTexto),
            this.text,
            style: TextStyle(fontSize: 17, color: this.colorTexto),
          ),
        ),
        decoration: BoxDecoration(),
      ),
    );
  }
}
