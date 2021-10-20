import 'package:femden/src/pages/pre_denuncia_page.dart';
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
  final String tipoDenuncia;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.tipoDenuncia);
}

class SeleccionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.hammer, 'Violencia Física',
          Color(0xff6989F5), Color(0xff906EF5), '5f8e631789766e1bdf4bb3c4'),
      new ItemBoton(FontAwesomeIcons.houseDamage, 'Violencia Patrimonial',
          Color(0xff66A9F2), Color(0xff536CF6), '5f8e634989766e1bdf4bb3c8'),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Violencia Psicológica',
          Color(0xffF2D572), Color(0xffE06AA3), '5f8e633c89766e1bdf4bb3c7'),
      new ItemBoton(FontAwesomeIcons.dollarSign, 'Violencia Económica',
          Color(0xff317183), Color(0xff46997D), '5f8e632789766e1bdf4bb3c5'),
      new ItemBoton(FontAwesomeIcons.female, 'Violencia Sexual', Colors.red,
          Color(0xffF2D572), '5f8e633189766e1bdf4bb3c6'),
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
                        pageBuilder: (_, __, ___) => PreDenunciaPage(
                            item.icon,
                            item.texto,
                            item.color1,
                            item.color2,
                            item.tipoDenuncia)));
              },
            ))
        .toList();

    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 225),
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
        icon: FontAwesomeIcons.home,
        subtitulo: 'Selecciona el',
        titulo: 'Tipo de Violencia',
        color1: Color.fromRGBO(91, 24, 123, 1),
        color2: Color.fromRGBO(91, 24, 123, 1),
      ),
      Positioned(right: 0, top: 45, child: BotonSingOut())
    ]);
  }
}
