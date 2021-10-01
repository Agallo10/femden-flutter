import 'package:femden/helpers/mostrar_alerta.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/services/denuncia_service.dart';
import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DenunciasPage extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String tipoDenuncia;

  DenunciasPage(
      this.icon, this.texto, this.color1, this.color2, this.tipoDenuncia);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          PageHeader(
            icon: icon,
            texto: this.texto,
            color1: this.color1,
            color2: this.color2,
          ),
          Container(
              margin: EdgeInsets.only(top: 260),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _From(tipoDenuncia: this.tipoDenuncia)),
          //Positioned(right: 20, top: 770, child: botonBajo(context)),
        ],
      ),
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
        subtitulo: 'Realice la denuncia',
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

class _From extends StatefulWidget {
  final String tipoDenuncia;
  final Color color1;

  const _From({Key key, this.tipoDenuncia, this.color1}) : super(key: key);

  @override
  __FromState createState() => __FromState(this.tipoDenuncia, this.color1);
}

class __FromState extends State<_From> {
  final textoController = TextEditingController();
  final String tipoDenuncia;
  final Color color1;

  //final fecha = DateTime.parse(DateFormat.yMMMMEEEEd().format(DateTime.now()));

  @override
  __FromState(this.tipoDenuncia, this.color1);

  @override
  Widget build(BuildContext context) {
    final denunciaService = Provider.of<DenunciaService>(context);
    return Container(
        child: Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 350,
            height: 370,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: textoController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Escriba aquí su denuncia',
                    // hintStyle: TextStyle(fontSize: ),
                    //labelStyle: TextStyle(color: this.color1),
                    border: InputBorder.none,
                  ),
                  maxLines: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botonBajo(context),
              Container(
                width: 20,
              ),
              Container(
                width: 200,
                height: 50,
                child: Boton(
                  color: Color.fromRGBO(91, 24, 123, 1),
                  text: 'Realizar denuncia',
                  colorTexto: Colors.white,
                  onPressed: denunciaService.autenticando
                      ? null
                      : () async {
                          print(textoController.text);
                          final uid = await AuthService.getUidPersona();
                          final denunciaOK =
                              await denunciaService.crearDenuncia(
                                  textoController.text, uid, this.tipoDenuncia);

                          if (denunciaOK) {
                            //Navegar a seleccion
                            mostrarAlerta(
                                context, ' Correcto', 'Denuncia Realizada');
                          } else {
                            mostrarAlerta(context, ' Error',
                                'No se pudo realizar la denuncia');
                          }
                        },
                ),
              ),
            ],
          )
        ])
      ],
    ));
  }
}

Widget botonBajo(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pop(context);
    },
    //elevation: 20,
    backgroundColor: Color.fromRGBO(91, 24, 123, 1),
    child: FaIcon(
      FontAwesomeIcons.arrowLeft,
      color: Colors.white,
    ),
  );
}
