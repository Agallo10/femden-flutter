import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class VerDenunciaPage extends StatefulWidget {
  final String uid;
  final String texto;
  final String fecha;
  final String estado;
  final String tipo;

  const VerDenunciaPage(
      this.uid, this.texto, this.fecha, this.estado, this.tipo);

  @override
  _VerDenunciaPageState createState() => _VerDenunciaPageState(this.uid);
}

class _VerDenunciaPageState extends State<VerDenunciaPage> {
  Map data;
  List comentarios;
  String uid;

  _VerDenunciaPageState(this.uid);

  @override
  void initState() {
    this.getComentariosID();
    super.initState();
  }

  getComentariosID() async {
    try {
      http.Response response = await http
          .get('${Environment.apiUrl}/comentarios/' + uid, headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      data = json.decode(response.body);

      if (mounted) {
        setState(() {
          comentarios = data['comentarios'];
          //print('heyyy');
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: 700.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              //centerTitle: true,
              //title: const Text('Flight Report'),
              background: Stack(
                alignment: Alignment.center,
                //fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromRGBO(91, 24, 123, 1),
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                        width: 380,
                        height: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${this.widget.texto}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.fade,
                              maxLines: 13,
                            ),
                            Text('Fecha: ${this.widget.fecha}',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey))
                          ],
                        ),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  Positioned(
                    top: 110,
                    child: Container(
                      //color: Colors.red,
                      alignment: Alignment.center,
                      height: 100,
                      width: 400,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Denuncia de tipo ${this.widget.tipo}',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 80.0,
            delegate: SliverChildBuilderDelegate(
                (_, i) => Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          "${comentarios[i]["comentario"]}",
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                        ),
                        trailing: FaIcon(FontAwesomeIcons.comments),
                        subtitle: Text("${comentarios[i]["fecha"]}"),
                        tileColor: Color.fromRGBO(221, 203, 236, 1),
                      ),
                    ),
                childCount: comentarios == null ? 0 : comentarios.length),
          ),
        ],
      ),
    );
  }
}
