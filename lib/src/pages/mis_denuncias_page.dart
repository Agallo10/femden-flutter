import 'package:femden/services/auth_service.dart';
import 'package:femden/services/denuncia_service.dart';
import 'package:femden/services/denuncias_service.dart';
import 'package:femden/src/models/denuncia.dart';
//import 'package:femden/src/pages/ver_denuncia_page.dart';
import 'package:femden/src/pages/ver_denuncia_page_2.dart';
import 'package:femden/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:femden/global/environment.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MisDenunciasPage extends StatefulWidget {
  @override
  _MisDenunciasPageState createState() => _MisDenunciasPageState();
}

class _MisDenunciasPageState extends State<MisDenunciasPage> {
  final denunciaService = DenunciaService();
  final denunciasService = DenunciasService();
  RefreshController refreshController1 =
      RefreshController(initialRefresh: false);
  RefreshController refreshController2 =
      RefreshController(initialRefresh: false);
  RefreshController refreshController3 =
      RefreshController(initialRefresh: false);

  Map data;
  List denunDataSeg;
  List denunDataFis;
  List denunDataFin;
  Map dataDenun;
  Denuncia denunciaData;

  @override
  void initState() {
    //this._cargarDenuncias();
    this.getDenunciasID();
    //this.getDenunciaID("");
    super.initState();
  }

  getDenunciasID() async {
    final uid = await AuthService.getUidPersona();

    try {
      http.Response response = await http
          .get('${Environment.apiUrl}/denuncias/' + uid, headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      data = json.decode(response.body);

      if (mounted) {
        setState(() {
          denunDataSeg = data['denunciasSeg'];
          denunDataFis = data['denunciasFis'];
          denunDataFin = data['denunciasFin'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  cargarDenuncias() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController1.refreshCompleted();
    refreshController2.refreshCompleted();
    refreshController3.refreshCompleted();
    getDenunciasID();
  }

  Future futuro() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return denunDataSeg;
  }

  Future futuro2() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return denunDataFis;
  }

  Future futuro3() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return denunDataFin;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Mis denuncias'),
          backgroundColor: Color.fromRGBO(91, 24, 123, 1),
          actions: [
            RawMaterialButton(
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
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.check),
                text: 'En seguimiento',
              ),
              Tab(
                icon: Icon(Icons.check_circle_outline),
                text: 'En estado fiscal',
              ),
              Tab(
                icon: Icon(Icons.check_circle),
                text: 'Finalizadas',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            FutureBuilder(
              future: futuro(),
              builder: (_, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? CircularProgressIndicator.adaptive()
                  : SmartRefresher(
                      controller: refreshController1,
                      enablePullDown: true,
                      onRefresh: cargarDenuncias,
                      header: WaterDropHeader(
                        complete: Icon(Icons.check,
                            color: Color.fromRGBO(91, 24, 123, 1)),
                        waterDropColor: Color.fromRGBO(91, 24, 123, 1),
                      ),
                      child: ListView.separated(
                        itemCount:
                            denunDataSeg == null ? 0 : denunDataSeg.length,
                        itemBuilder: (_, i) => ListTile(
                            title: Text("${denunDataSeg[i]["tipo"]["nombre"]}"),
                            trailing: FaIcon(FontAwesomeIcons.hourglassStart),
                            subtitle: Text(
                              ("${denunDataSeg[i]["texto"]}"),
                              maxLines: 3,
                            ),
                            onTap: () async {
                              String denunciaUid = '${denunDataSeg[i]["uid"]}';
                              String denunciaTexto =
                                  '${denunDataSeg[i]["texto"]}';
                              String denunciafecha =
                                  '${denunDataSeg[i]["fecha"]}';
                              String denunciaEstado =
                                  '${denunDataSeg[i]["estado"]["nombre"]}';
                              String denunciaTipo =
                                  '${denunDataSeg[i]["tipo"]["nombre"]}';
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          VerDenunciaPage2(
                                              denunciaUid,
                                              denunciaTexto,
                                              denunciafecha,
                                              denunciaEstado,
                                              denunciaTipo)));
                            }),
                        separatorBuilder: (_, i) => Divider(),
                      ),
                    ),
            ),
            FutureBuilder(
              future: futuro2(),
              builder: (_, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? CircularProgressIndicator.adaptive()
                  : SmartRefresher(
                      enablePullDown: true,
                      onRefresh: cargarDenuncias,
                      controller: refreshController2,
                      header: WaterDropHeader(
                        complete: Icon(Icons.check,
                            color: Color.fromRGBO(91, 24, 123, 1)),
                        waterDropColor: Color.fromRGBO(91, 24, 123, 1),
                      ),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            denunDataFis == null ? 0 : denunDataFis.length,
                        itemBuilder: (_, i) => ListTile(
                            title: Text("${denunDataFis[i]["tipo"]["nombre"]}"),
                            trailing: FaIcon(FontAwesomeIcons.hourglassHalf),
                            subtitle: Text("${denunDataFis[i]["texto"]}"),
                            onTap: () async {
                              String denunciaUid = '${denunDataFis[i]["uid"]}';
                              String denunciaTexto =
                                  '${denunDataFis[i]["texto"]}';
                              String denunciafecha =
                                  '${denunDataFis[i]["fecha"]}';
                              String denunciaEstado =
                                  '${denunDataFis[i]["estado"]["nombre"]}';
                              String denunciaTipo =
                                  '${denunDataFis[i]["tipo"]["nombre"]}';
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          VerDenunciaPage2(
                                              denunciaUid,
                                              denunciaTexto,
                                              denunciafecha,
                                              denunciaEstado,
                                              denunciaTipo)));
                            }),
                        separatorBuilder: (_, i) => Divider(),
                      ),
                    ),
            ),
            FutureBuilder(
              future: futuro3(),
              builder: (_, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? CircularProgressIndicator.adaptive()
                  : SmartRefresher(
                      enablePullDown: true,
                      onRefresh: cargarDenuncias,
                      controller: refreshController3,
                      header: WaterDropHeader(
                        complete: Icon(Icons.check,
                            color: Color.fromRGBO(91, 24, 123, 1)),
                        waterDropColor: Color.fromRGBO(91, 24, 123, 1),
                      ),
                      child: ListView.separated(
                        itemCount:
                            denunDataFin == null ? 0 : denunDataFin.length,
                        separatorBuilder: (_, i) => Divider(),
                        itemBuilder: (_, i) => ListTile(
                            title: Text("${denunDataFin[i]["tipo"]["nombre"]}"),
                            trailing: FaIcon(FontAwesomeIcons.hourglassEnd),
                            subtitle: Text("${denunDataFin[i]["texto"]}"),
                            onTap: () async {
                              String denunciaUid = '${denunDataFin[i]["uid"]}';
                              String denunciaTexto =
                                  '${denunDataFin[i]["texto"]}';
                              String denunciafecha =
                                  '${denunDataFin[i]["fecha"]}';
                              String denunciaEstado =
                                  '${denunDataFin[i]["estado"]["nombre"]}';
                              String denunciaTipo =
                                  '${denunDataFin[i]["tipo"]["nombre"]}';
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          VerDenunciaPage2(
                                              denunciaUid,
                                              denunciaTexto,
                                              denunciafecha,
                                              denunciaEstado,
                                              denunciaTipo)));
                            }),
                      ),
                    ),
            ),
          ],
        ),
        //)
      ),
    );
  }

  // ListView _listViewDenuncias(int itemCount, List denuncias) {
  //   return ListView.separated(
  //     itemCount: itemCount,
  //     itemBuilder: (_, i) => __listTileDenuncias(denuncias[i]),
  //     separatorBuilder: (_, i) => Divider(),
  //   );
  // }

  // ListTile __listTileDenuncias(Denuncia denuncia) {
  //   return ListTile(
  //       title: Text(denuncia.tipo),
  //       trailing: FaIcon(FontAwesomeIcons.hourglassStart),
  //       subtitle: Text((denuncia.texto)),
  //       onTap: () async {
  //         Navigator.push(
  //             context,
  //             PageRouteBuilder(
  //                 pageBuilder: (_, __, ___) => VerDenunciaPage2(
  //                     denuncia.uid,
  //                     denuncia.texto,
  //                     denuncia.fecha,
  //                     denuncia.estado,
  //                     denuncia.tipo)));
  //       });
  // }
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
