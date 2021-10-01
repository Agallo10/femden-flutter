// To parse this JSON data, do
//
//     final denunciasReponse = denunciasReponseFromJson(jsonString);

import 'dart:convert';

import 'package:femden/src/models/denuncia.dart';

DenunciasReponse denunciasReponseFromJson(String str) =>
    DenunciasReponse.fromJson(json.decode(str));

String denunciasReponseToJson(DenunciasReponse data) =>
    json.encode(data.toJson());

class DenunciasReponse {
  DenunciasReponse({
    this.ok,
    this.denunciasSeg,
    this.denunciasFis,
    this.denunciasFin,
    this.total,
  });

  bool ok;
  List<Denuncia> denunciasFis;
  List<Denuncia> denunciasSeg;
  List<Denuncia> denunciasFin;
  int total;

  factory DenunciasReponse.fromJson(Map<String, dynamic> json) =>
      DenunciasReponse(
        ok: json["ok"],
        denunciasSeg: List<Denuncia>.from(
            json["denunciasSeg"].map((x) => Denuncia.fromJson(x))),
        denunciasFis: List<Denuncia>.from(
            json["denunciasFis"].map((x) => Denuncia.fromJson(x))),
        denunciasFin: List<Denuncia>.from(
            json["denunciasFin"].map((x) => Denuncia.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "denunciasSeg": List<dynamic>.from(denunciasSeg.map((x) => x.toJson())),
        "denunciasFis": List<dynamic>.from(denunciasFis.map((x) => x.toJson())),
        "denunciasFin": List<dynamic>.from(denunciasFin.map((x) => x)),
        "total": total,
      };
}
