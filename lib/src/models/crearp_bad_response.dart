// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

CrearPeBadResponse crearPeBadResponseFromJson(String str) =>
    CrearPeBadResponse.fromJson(json.decode(str));

String crearPeBadResponseToJson(CrearPeBadResponse data) =>
    json.encode(data.toJson());

class CrearPeBadResponse {
  CrearPeBadResponse({
    this.ok,
    this.msg,
  });

  bool ok;
  String msg;

  factory CrearPeBadResponse.fromJson(Map<String, dynamic> json) =>
      CrearPeBadResponse(
        ok: json["ok"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
      };
}
