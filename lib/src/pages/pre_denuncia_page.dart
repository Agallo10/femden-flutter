import 'package:femden/services/auth_service.dart';
import 'package:femden/src/pages/denuncia_page.dart';
import 'package:femden/widgets/boton.dart';
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
      Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'inicio');
              AuthService.deleteToken();
              AuthService.deleteUidPersona();
            },
            shape: CircleBorder(),
            child: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.white,
            ),
          )),
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
        Text(
          _info(tipo),
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 18),
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
    return 'Consiste en causar o intentar causar daño a una pareja golpeándola, propinándole patadas, quemándola, agarrándola, pellizcándola, empujándola, dándole bofetadas, tirándole del cabello, mordiéndole, denegándole atención médica u obligándola a consumir alcohol o drogas, así como empleando cualquier otro tipo de fuerza física contra ella. Puede incluir daños a la propiedad.';
  }
  if (tipo == '5f8e632789766e1bdf4bb3c5') {
    return 'Consiste en lograr o intentar conseguir la dependencia financiera de otra persona, manteniendo para ello un control total sobre sus recursos financieros, impidiéndole acceder a ellos y prohibiéndole trabajar o asistir a la escuela.';
  }
  if (tipo == '5f8e633189766e1bdf4bb3c6') {
    return 'Conlleva obligar a una pareja a participar en un acto sexual sin su consentimiento. Véase infra para obtener más información sobre la violencia sexual.';
  }
  if (tipo == '5f8e633c89766e1bdf4bb3c7') {
    return 'Consiste en provocar miedo a través de la intimidación; en amenazar con causar daño físico a una persona, su pareja o sus hijas o hijos, o con destruir sus mascotas y bienes; en someter a una persona a maltrato psicológico o en forzarla a aislarse de sus amistades, de su familia, de la escuela o del trabajo.';
  }
  if (tipo == '5f8e634989766e1bdf4bb3c8') {
    return 'Se considera violencia patrimonial a toda conducta activa u omisiva que directa o indirectamente, en los ámbitos público y privado, esté dirigida a ocasionar un daño a los bienes muebles o inmuebles en menoscabo del patrimonio de las mujeres víctimas de violencia o a los bienes comunes. También la que se dirige a ocasionar un menoscabo en los recursos económicos o patrimoniales de la mujer, a través de la perturbación de la posesión, tenencia o propiedad de sus bienes, pérdida, sustracción, destrucción, retención o distracción indebida de objetos, instrumentos de trabajo, documentos personales, bienes, valores y derechos patrimoniales. Incluye todo acto que genere limitaciones económicas encaminadas a controlar sus ingresos, o la privación de los medios económicos indispensables para vivir.';
  } else {
    return '';
  }
}
