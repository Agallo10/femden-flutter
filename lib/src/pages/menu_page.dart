import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:femden/src/pages/mis_denuncias_page.dart';
import 'package:femden/src/pages/orientacion.dart';
import 'package:femden/src/pages/perfil_page.dart';
import 'package:femden/src/pages/seleccion.dart';
import 'package:flutter/material.dart';
//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _fancyBoton2(),
    );
  }

  Widget _callPage(int paginActual) {
    switch (paginActual) {
      case 0:
        return SeleccionPage();
      case 1:
        return MisDenunciasPage();
      case 2:
        return OrientacionPage();
      case 3:
        return PerfilPage();

      default:
        return SeleccionPage();
    }
  }

  // Widget _fancyBoton() {
  //   return Container(
  //     color: Colors.amber,
  //     child: FancyBottomNavigation(
  //         initialSelection: currentIndex,
  //         circleColor: Color.fromRGBO(91, 24, 123, 1),
  //         inactiveIconColor: Color.fromRGBO(91, 24, 123, 1),
  //         tabs: [
  //           TabData(iconData: FontAwesomeIcons.home, title: "Home"),
  //           TabData(iconData: FontAwesomeIcons.list, title: "Mis denuncias"),
  //           TabData(iconData: FontAwesomeIcons.book, title: "Informacion"),
  //           TabData(iconData: FontAwesomeIcons.userAlt, title: "perfil")
  //         ],
  //         onTabChangedListener: (index) {
  //           setState(() {
  //             currentIndex = index;
  //           });
  //         }),
  //   );
  // }

  Widget _fancyBoton2() {
    return Container(
      child: CurvedNavigationBar(
        height: 65,
        backgroundColor: Color.fromRGBO(91, 24, 123, 0),
        color: Color.fromRGBO(221, 203, 236, 1),
        items: <Widget>[
          Icon(FontAwesomeIcons.home,
              size: 20, color: Color.fromRGBO(91, 24, 123, 1)),
          Icon(FontAwesomeIcons.list,
              size: 20, color: Color.fromRGBO(91, 24, 123, 1)),
          Icon(FontAwesomeIcons.book,
              size: 20, color: Color.fromRGBO(91, 24, 123, 1)),
          Icon(FontAwesomeIcons.userAlt,
              size: 20, color: Color.fromRGBO(91, 24, 123, 1)),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
