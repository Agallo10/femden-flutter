// To parse this JSON data, do
//
//     final denuncia = denunciaFromJson(jsonString);

import 'dart:convert';

Denuncia denunciaFromJson(String str) => Denuncia.fromJson(json.decode(str));

String denunciaToJson(Denuncia data) => json.encode(data.toJson());

class Denuncia {
  Denuncia({
    this.texto,
    this.persona,
    this.estado,
    this.tipo,
    this.fecha,
    this.uid,
  });

  String texto;
  String persona;
  String estado;
  String tipo;
  DateTime fecha;
  String uid;

  factory Denuncia.fromJson(Map<String, dynamic> json) => Denuncia(
        texto: json["texto"],
        persona: json["persona"],
        estado: json["estado"],
        tipo: json["tipo"],
        fecha: DateTime.parse(json["fecha"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "texto": texto,
        "persona": persona,
        "estado": estado,
        "tipo": tipo,
        "fecha": fecha.toIso8601String(),
        "uid": uid,
      };
}
