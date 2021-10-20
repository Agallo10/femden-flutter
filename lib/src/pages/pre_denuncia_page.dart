import 'package:femden/src/pages/denuncia_page.dart';
import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/boton_cerrar_cesion.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreDenunciaPage extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String tipoDenuncia;

  PreDenunciaPage(
      this.icon, this.texto, this.color1, this.color2, this.tipoDenuncia);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Container(
                //color: Colors.red,
                margin: EdgeInsets.only(top: 250),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: _cuerpoDenuncia(this.tipoDenuncia),
                )),
            Container(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: botonBajo(context, this.color1),
                  ),
                  Container(
                    width: 25,
                  ),
                  Container(
                    width: 200,
                    height: 45,
                    child: _botonSeguir(this.icon, this.texto, this.color1,
                        this.color2, this.tipoDenuncia, context),
                  )
                ],
              ),
            ),
          ],
        ),
        PageHeader(
          icon: icon,
          texto: this.texto,
          color1: this.color1,
          color2: this.color2,
        ),
      ],
    ));
  }
}

class PageHeader extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  const PageHeader({this.icon, this.texto, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconHeader(
        icon: this.icon,
        subtitulo: '',
        titulo: this.texto,
        color1: this.color1,
        color2: this.color2,
      ),
      Positioned(right: 0, top: 45, child: BotonSingOut()),
      //Positioned(right: 100, top: 660, child: botonTraido())
    ]);
  }
}

Widget botonBajo(BuildContext context, color) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pop(context);
    },
    //elevation: 20,
    backgroundColor: color,
    child: FaIcon(
      FontAwesomeIcons.arrowLeft,
      color: Colors.white,
    ),
  );
}

Widget _cuerpoDenuncia(tipo) {
  return Container(
    child: Column(
      children: [
        Container(
          //color: Colors.blueAccent,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            _info(tipo),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 21),
          ),
        ),
        Flex(direction: Axis.vertical),
      ],
    ),
  );
}

Widget _botonSeguir(IconData icon, String texto, Color color1, Color color2,
    String tipoDenuncia, context) {
  return Boton(
      text: 'Continuar',
      color: color2,
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    DenunciasPage(icon, texto, color1, color2, tipoDenuncia)));
      });
}

_info(String tipo) {
  if (tipo == '5f8e631789766e1bdf4bb3c4') {
    return 'Daño o sufrimiento físico: Riesgo o disminución de la integridad corporal de una persona.';
  }
  if (tipo == '5f8e632789766e1bdf4bb3c5') {
    return 'Consiste en lograr o intentar conseguir la dependencia financiera de otra persona, manteniendo para ello un control total sobre sus recursos financieros, impidiéndole acceder a ellos y prohibiéndole trabajar o asistir a la escuela.';
  }
  if (tipo == '5f8e633189766e1bdf4bb3c6') {
    return 'Consecuencias que provienen de la acción consistente en obligar a una persona a mantener contacto sexualizado, físico o verbal, o a participar en otras interacciones sexuales mediante el uso de fuerza, intimidación, coerción, chantaje, soborno, manipulación, amenaza o cualquier otro mecanismo que anule o limite la voluntad personal.';
  }
  if (tipo == '5f8e633c89766e1bdf4bb3c7') {
    return 'Consecuencia proveniente de la acción u omisión destinada a degradar o controlar las acciones, comportamientos, creencias y decisiones de otras personas, por medio de intimidación, manipulación, amenaza, directa o indirecta, humillación, aislamiento o cualquier otra conducta que implique un perjuicio en la salud psicológica, la autodeterminación o el desarrollo personal.';
  }
  if (tipo == '5f8e634989766e1bdf4bb3c8') {
    return 'Pérdida, sustracción, destrucción, retención o distracción de objetos, instrumentos de trabajo, documentos personales, bienes, valores, derechos o económicos destinados a satisfacer las necesidades de la mujer';
  } else {
    return '';
  }
}
