// To parse this JSON data, do
//
//     final estadoDenuncia = estadoDenunciaFromJson(jsonString);

import 'dart:convert';

EstadoDenuncia estadoDenunciaFromJson(String str) =>
    EstadoDenuncia.fromJson(json.decode(str));

String estadoDenunciaToJson(EstadoDenuncia data) => json.encode(data.toJson());

class EstadoDenuncia {
  EstadoDenuncia({
    this.nombre,
    this.uid,
  });

  String nombre;
  String uid;

  factory EstadoDenuncia.fromJson(Map<String, dynamic> json) => EstadoDenuncia(
        nombre: json["nombre"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "uid": uid,
      };
}
