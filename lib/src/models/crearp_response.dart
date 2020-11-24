// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:femden/src/models/persona.dart';

CrearpResponse crearpResponseFromJson(String str) =>
    CrearpResponse.fromJson(json.decode(str));

String crearpResponseTOJson(CrearpResponse data) => json.encode(data.toJson());

class CrearpResponse {
  CrearpResponse({
    this.ok,
    this.token,
    this.persona,
  });

  bool ok;
  String token;
  Persona persona;

  factory CrearpResponse.fromJson(Map<String, dynamic> json) => CrearpResponse(
        ok: json["ok"],
        token: json["token"],
        persona: Persona.fromJson(json["personaDB"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "personaDB": persona.toJson(),
      };
}
