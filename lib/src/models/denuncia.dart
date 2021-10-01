// To parse this JSON data, do
//
//     final denuncia = denunciaFromJson(jsonString);

import 'dart:convert';

//import 'package:femden/src/models/persona.dart';
//import 'package:femden/src/models/tipo_denuncia.dart';

//import 'estado_denuncia.dart';

Denuncia denunciaFromJson(String str) => Denuncia.fromJson(json.decode(str));

String denunciaToJson(Denuncia data) => json.encode(data.toJson());

class Denuncia {
  Denuncia({
    this.texto,
    this.persona,
    this.tipo,
    this.fecha,
    this.estado,
    this.uid,
  });

  String texto;
  String persona;
  String estado;
  String tipo;
  String fecha;
  String uid;

  factory Denuncia.fromJson(Map<String, dynamic> json) => Denuncia(
        texto: json["texto"],
        persona: json["persona"],
        estado: json["estado"],
        tipo: json["tipo"],
        fecha: json["fecha"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "texto": texto,
        "persona": persona,
        "estado": estado,
        "tipo": tipo,
        "fecha": fecha,
        "uid": uid,
      };
}
