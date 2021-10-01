import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  const Labels({Key key, @required this.ruta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Text('Label'),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              'Volver',
              style: TextStyle(
                  color: Color.fromRGBO(221, 203, 236, 1), fontSize: 28),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
          // SizedBox(
          //   height: 20,
          // )
        ],
      ),
    );
  }
}
