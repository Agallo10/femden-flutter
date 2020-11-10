import 'package:femden/src/pages/inicio.dart';
import 'package:femden/src/pages/login_page.dart';
import 'package:femden/src/pages/register_page.dart';
import 'package:femden/src/pages/seleccion.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'seleccion': (_) => SeleccionPage(),
  'inicio': (_) => InicioScroll(),
};
