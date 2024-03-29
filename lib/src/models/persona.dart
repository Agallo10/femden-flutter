// To parse this JSON data, do
//
//     final persona = personaFromJson(jsonString);

import 'dart:convert';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

class Persona {
  Persona({
    this.nombre,
    this.documento,
    this.email,
    this.telefono,
    this.direccion,
    this.uid,
    this.fechaNacimiento,
    this.edad,
  });

  String nombre;
  String documento;
  String email;
  int telefono;
  String direccion;
  String uid;
  String fechaNacimiento;
  int edad;

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
      nombre: json["nombre"],
      documento: json["documento"],
      email: json["email"],
      telefono: json["telefono"],
      direccion: json["direccion"],
      uid: json["uid"],
      fechaNacimiento: json["fechaNacimiento"],
      edad: json["edad"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "documento": documento,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "uid": uid,
        "fechaNacimiento": fechaNacimiento,
        "edad": edad,
      };
}
