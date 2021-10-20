import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class VerDenunciaPage2 extends StatefulWidget {
  final String uid;
  final String texto;
  final String fecha;
  final String estado;
  final String tipo;
  final int numeroRadicado;

  const VerDenunciaPage2(this.uid, this.texto, this.fecha, this.estado,
      this.tipo, this.numeroRadicado);

  @override
  _VerDenunciaPage2State createState() => _VerDenunciaPage2State(this.uid);
}

class _VerDenunciaPage2State extends State<VerDenunciaPage2> {
  Map data;
  List comentarios;
  String uid;

  _VerDenunciaPage2State(this.uid);

  @override
  void initState() {
    this.getComentariosID();
    super.initState();
  }

  Future getComentariosID() async {
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

  Future futuro() async {
    await Future.delayed(Duration(milliseconds: 1000));

    return comentarios;
  }

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    Color colorEstado;

    if (this.widget.estado == 'En seguimiento') {
      colorEstado = Colors.green;
    }
    if (this.widget.estado == 'En estado fiscal') {
      colorEstado = Colors.purple;
    }
    if (this.widget.estado == 'Finalizada') {
      colorEstado = Colors.red;
    }

    int nullMethodRadicado() {
      int numeroRadicado = this.widget.numeroRadicado;
      return numeroRadicado ?? 0;
    }

    return Scaffold(
      appBar: AppBar(
        //title: Text(this.widget.tipo),
        backgroundColor: Color.fromRGBO(91, 24, 123, 1),
        // title: Text(
        //   'Denuncia de tipo ${this.widget.tipo}',
        //   style: TextStyle(fontSize: 20),
        // ),
        //flexibleSpace: Container(width: 20, color: Colors.red),
      ),
      body: Stack(
        alignment: Alignment.center,
        //fit: StackFit.expand,
        children: <Widget>[
          SafeArea(
            child: Container(
              //color: Colors.redAccent,
              margin: EdgeInsets.only(top: 100, right: 20, left: 20),
              width: double.infinity,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // listTileInfo(this.widget.texto, ''),
                  // listTileInfo('Su denuncia esta ${this.widget.estado}', ''),
                  // listTileInfo(this.widget.fecha, ''),
                  Container(
                    child: Text(
                      '${this.widget.texto}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.fade,
                      //maxLines: 13,
                    ),
                  ),
                  Divider(),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(text: 'Su denuncia esta '),
                        TextSpan(
                            text: this.widget.estado,
                            style: TextStyle(
                                fontSize: 16,
                                color: colorEstado,
                                fontWeight: FontWeight.bold)),
                      ])),
                  Divider(),
                  Text('Número de radicado: ${nullMethodRadicado()}',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  Divider(),

                  Text('Fecha: ${this.widget.fecha}',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Divider(),
                  Container(
                    height: 160,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 2,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 400,
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Denuncia de tipo ${this.widget.tipo}',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FutureBuilder(
              future: futuro(),
              builder: (_, snapshot) {
                if (comentarios?.length == null || comentarios?.length == 0) {
                  isVisible = false;
                }
                return snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator(
                        color: Color.fromRGBO(91, 24, 123, 1),
                      )
                    : Visibility(
                        visible: isVisible,
                        child: SizedBox.expand(
                            child: DraggableScrollableSheet(
                          initialChildSize: 0.12,
                          minChildSize: 0.1,
                          maxChildSize: 0.9,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Container(
                                child: ListView.separated(
                                  controller: scrollController,
                                  itemCount: comentarios == null
                                      ? 0
                                      : comentarios.length,
                                  separatorBuilder: (_, i) => Divider(),
                                  itemBuilder: (BuildContext context, int i) {
                                    return ListTile(
                                      title: Text(
                                          "${comentarios[i]["comentario"]}",
                                          overflow: TextOverflow.fade,
                                          maxLines: 3),
                                      trailing:
                                          FaIcon(FontAwesomeIcons.comments),
                                      subtitle:
                                          Text("${comentarios[i]["fecha"]}"),
                                      onTap: () {
                                        _alerta(
                                            context,
                                            'Comentario',
                                            "${comentarios[i]["comentario"]}",
                                            "Fecha: ${comentarios[i]["fecha"]}");
                                      },
                                      //tileColor: Color.fromRGBO(221, 203, 236, 1),
                                    );
                                  },
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(221, 203, 236, 1),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            );
                          },
                        )),
                      );
              })
        ],
      ),
    );
  }

  ListTile listTileInfo(String info, String sub) {
    return ListTile(
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
  String contenido2,
) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            //contentPadding: EdgeInsets.fromLTRB(180, 20, 0, 20),
            title: Text(titulo),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  contenido,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                Divider(),
                Text(contenido2),
              ],
            ),
            actions: [
              MaterialButton(
                  child: Text('OK'),
                  elevation: 5,
                  textColor: Colors.purple,
                  onPressed: () => Navigator.pop(context)),
            ],
          ));
}
