import 'package:femden/routes/routes.dart';
import 'package:femden/src/pages/seleccion.dart';
import 'package:flutter/material.dart';
import 'package:femden/src/pages/inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FEMDEN',
        initialRoute: 'inicio',
        routes: appRoutes);
  }
}
