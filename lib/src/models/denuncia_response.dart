// To parse this JSON data, do
//
//     final denunciaResponse = denunciaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:femden/src/models/denuncia.dart';

DenunciaResponse denunciaResponseFromJson(String str) =>
    DenunciaResponse.fromJson(json.decode(str));

String denunciaResponseToJson(DenunciaResponse data) =>
    json.encode(data.toJson());

class DenunciaResponse {
  DenunciaResponse({
    this.ok,
    this.denuncia,
  });

  bool ok;
  Denuncia denuncia;

  factory DenunciaResponse.fromJson(Map<String, dynamic> json) =>
      DenunciaResponse(
        ok: json["ok"],
        denuncia: Denuncia.fromJson(json["denunciaDB"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "denunciaDB": denuncia.toJson(),
      };
}

// class Denuncia {
//   Denuncia({
//     this.texto,
//     this.persona,
//     this.estado,
//     this.tipo,
//     this.fecha,
//     this.uid,
//   });

//   String texto;
//   String persona;
//   String estado;
//   String tipo;
//   DateTime fecha;
//   String uid;

//   factory Denuncia.fromJson(Map<String, dynamic> json) => Denuncia(
//         texto: json["texto"],
//         persona: json["persona"],
//         estado: json["estado"],
//         tipo: json["tipo"],
//         fecha: DateTime.parse(json["fecha"]),
//         uid: json["uid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "texto": texto,
//         "persona": persona,
//         "estado": estado,
//         "tipo": tipo,
//         "fecha": fecha.toIso8601String(),
//         "uid": uid,
//       };
// }
