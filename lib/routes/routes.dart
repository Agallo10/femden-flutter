import 'package:femden/src/pages/inicio.dart';
import 'package:femden/src/pages/loading_page.dart';
import 'package:femden/src/pages/login_page.dart';
import 'package:femden/src/pages/menu_page.dart';
import 'package:femden/src/pages/mis_denuncias_page.dart';
import 'package:femden/src/pages/orientacion.dart';
import 'package:femden/src/pages/perfil_page.dart';
import 'package:femden/src/pages/register_page.dart';
import 'package:femden/src/pages/seleccion.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'seleccion': (_) => SeleccionPage(),
  'inicio': (_) => InicioScroll(),
  'loading': (_) => LoadingPage(),
  'menu': (_) => MenuPage(),
  'orientacion': (_) => OrientacionPage(),
  'denuncias': (_) => MisDenunciasPage(),
  'perfil': (_) => PerfilPage(),
  //'denuncia': (_) => DenunciasPage(null, null, null, null),
};
