import 'package:femden/services/auth_service.dart';
import 'package:femden/services/denuncia_service.dart';
import 'package:femden/src/models/denuncia.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MisDenunciasPage extends StatefulWidget {
  @override
  _MisDenunciasPageState createState() => _MisDenunciasPageState();
}

class _MisDenunciasPageState extends State<MisDenunciasPage> {
  final denunciaService = DenunciaService();
  List<Denuncia> denuncias = [];

  @override
  void initState() {
    this._cargarDenuncias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      PageHeader(),
      Container(
        width: double.infinity,
        height: 490,
        //color: Colors.red,
        child: ListView.separated(
            itemBuilder: (_, i) => ListTile(
                  title: Text((denuncias[i].fecha).toIso8601String()),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(91, 24, 123, 1),
                    child: FaIcon(
                      FontAwesomeIcons.clock,
                      color: Colors.white,
                    ),
                  ),
                ),
            separatorBuilder: (_, i) => Divider(),
            itemCount: denuncias.length),
      ),
    ]));
  }

  _cargarDenuncias() async {
    this.denuncias = await denunciaService.getDenunciasPorId();

    setState(() {});
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
        icon: FontAwesomeIcons.list,
        subtitulo: '',
        titulo: 'Mis denuncias',
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
