import 'package:femden/services/auth_service.dart';
import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final persona = authService.persona;

    String nullMethodFecha() {
      String fecha = persona.fechaNacimiento;
      return fecha ?? "No se ha digitado la fecha";
    }

    int nullMethodEdad() {
      int edad = persona.edad;
      return edad ?? 0;
    }

    return Stack(alignment: Alignment.center, children: [
      Container(
          margin: EdgeInsets.only(top: 230),
          child: Container(
              width: 340,
              //height: 500,
              child: ListView(
                children: [
                  listTileInfo(persona.documento, FontAwesomeIcons.addressCard,
                      'Documento'),
                  listTileInfo(nullMethodFecha(), FontAwesomeIcons.calendarAlt,
                      'Fecha de nacimiento'),
                  listTileInfo(nullMethodEdad().toString(),
                      FontAwesomeIcons.child, 'Edad'),
                  listTileInfo(persona.email, FontAwesomeIcons.at, 'Correo'),
                  listTileInfo(persona.telefono.toString(),
                      FontAwesomeIcons.phoneSquare, 'Telefono'),
                  listTileInfo(persona.direccion, FontAwesomeIcons.mapMarkerAlt,
                      'Dirección'),
                  Container(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      child: Boton(
                          text: 'Eliminar Cuenta',
                          color: Colors.redAccent,
                          onPressed: () {
                            _alerta(context, 'Eliminar',
                                '¿Esta seguro que desea eliminar su cuenta?');
                          }),
                    ),
                  ),
                  Container(
                    height: 40,
                  )
                ],
              )),
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12))),
      PageHeader(titulo: persona.nombre)
    ]);
  }

  ListTile listTileInfo(String info, IconData icon, String sub) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: Color.fromRGBO(91, 24, 123, 1),
      ),
      title: Text(
        info,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(sub, style: TextStyle(fontSize: 18)),
    );
  }
}

_alerta(
  BuildContext context,
  String titulo,
  String contenido,
) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            //contentPadding: EdgeInsets.fromLTRB(180, 20, 0, 20),
            title: Text(titulo),
            content: Text(contenido),
            actions: [
              MaterialButton(
                  child: Text('Si'),
                  elevation: 5,
                  textColor: Colors.purple,
                  onPressed: () => Navigator.pop(context)),
              MaterialButton(
                  child: Text('No'),
                  elevation: 5,
                  textColor: Colors.purple,
                  onPressed: () => Navigator.pop(context))
            ],
          ));
}

class PageHeader extends StatelessWidget {
  final String titulo;
  const PageHeader({
    Key key,
    @required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconHeader(
        icon: FontAwesomeIcons.userAlt,
        subtitulo: 'Bienvenido',
        titulo: titulo,
        color1: Color.fromRGBO(91, 24, 123, 1),
        color2: Color.fromRGBO(91, 24, 123, 1),
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
          ))
    ]);
  }
}
