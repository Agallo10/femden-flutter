// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:femden/src/models/persona.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.token,
    this.persona,
  });

  bool ok;
  String token;
  Persona persona;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        token: json["token"],
        persona: Persona.fromJson(json["persona"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "persona": persona.toJson(),
      };
}
