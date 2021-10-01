// To parse this JSON data, do
//
//     final tipoDenuncia = tipoDenunciaFromJson(jsonString);

import 'dart:convert';

TipoDenuncia tipoDenunciaFromJson(String str) =>
    TipoDenuncia.fromJson(json.decode(str));

String tipoDenunciaToJson(TipoDenuncia data) => json.encode(data.toJson());

class TipoDenuncia {
  TipoDenuncia({
    this.nombre,
    this.uid,
  });

  String nombre;
  String uid;

  factory TipoDenuncia.fromJson(Map<String, dynamic> json) => TipoDenuncia(
        nombre: json["nombre"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "uid": uid,
      };
}
