import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final estiloTexto =
      TextStyle(color: Color.fromRGBO(221, 203, 236, 1), fontSize: 28);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/derechos-mujer.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'FEMDEN',
              style: estiloTexto,
            )
          ],
        ),
      ),
    );
  }
}
