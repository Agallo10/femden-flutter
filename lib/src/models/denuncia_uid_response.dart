// To parse this JSON data, do
//
//     final denunciaUidResponse = denunciaUidResponseFromJson(jsonString);

import 'dart:convert';

import 'package:femden/src/models/denuncia.dart';

DenunciaUidResponse denunciaUidResponseFromJson(String str) =>
    DenunciaUidResponse.fromJson(json.decode(str));

String denunciaUidResponseToJson(DenunciaUidResponse data) =>
    json.encode(data.toJson());

class DenunciaUidResponse {
  DenunciaUidResponse({
    this.ok,
    this.denuncias,
    this.total,
  });

  bool ok;
  List<Denuncia> denuncias;
  int total;

  factory DenunciaUidResponse.fromJson(Map<String, dynamic> json) =>
      DenunciaUidResponse(
        ok: json["ok"],
        denuncias: List<Denuncia>.from(
            json["denuncias"].map((x) => Denuncia.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "denuncias": List<dynamic>.from(denuncias.map((x) => x.toJson())),
        "total": total,
      };
}
