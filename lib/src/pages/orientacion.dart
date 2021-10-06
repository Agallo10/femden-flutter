import 'package:femden/services/auth_service.dart';
import 'package:femden/src/pages/uso_app.dart';
import 'package:femden/widgets/boton_cerrar_cesion.dart';
import 'package:femden/widgets/boton_denuncia.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String pagina;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.pagina);
}

class OrientacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(
          FontAwesomeIcons.mobileAlt,
          'Uso de la aplicación',
          Color.fromRGBO(91, 24, 123, 1),
          Color.fromRGBO(91, 24, 123, 1),
          'uso'),
      new ItemBoton(
          FontAwesomeIcons.bookOpen,
          'Tipos de denuncia',
          Color.fromRGBO(91, 24, 123, 1),
          Color.fromRGBO(91, 24, 123, 1),
          'tipos'),
    ];

    List<Widget> itemMap = items
        .map((item) => BotonDenuncia(
              icon: item.icon,
              texto: item.texto,
              color1: item.color1,
              color2: item.color2,
              onPress: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => UsoAppPage(
                              pagina: item.pagina,
                            )));
              },
            ))
        .toList();

    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 280),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [...itemMap],
        ),
      ),
      PageHeader()
    ]);
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconHeader(
        icon: FontAwesomeIcons.book,
        subtitulo: '',
        titulo: 'Orientación',
        color1: Color.fromRGBO(91, 24, 123, 1),
        color2: Color.fromRGBO(91, 24, 123, 1),
      ),
      Positioned(right: 0, top: 45, child: BotonSingOut())
    ]);
  }
}
