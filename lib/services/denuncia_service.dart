import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/src/models/denuncia.dart';
import 'package:femden/src/models/denuncia_response.dart';
import 'package:femden/src/models/denuncias_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DenunciaService with ChangeNotifier {
  Denuncia denuncia;
  List<Denuncia> denuncias;
  bool _autenticando = false;
  //final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  static Future<String> getUidPersona() async {
    final _storage = new FlutterSecureStorage();
    final uid = await _storage.read(key: 'uid');
    return uid;
  }

  Future<List<Denuncia>> getDenunciasPorId(String pide) async {
    final uid = await AuthService.getUidPersona();

    try {
      final resp = await http.get('${Environment.apiUrl}/denuncias/' + uid,
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });
      //print(resp.body);
      print('lista');

      final denunciasReponse = denunciasReponseFromJson(resp.body);

      print(denunciasReponse);
      print('lista');
      if (pide == 'seg') {
        return denunciasReponse.denunciasSeg;
      }
      if (pide == 'fis') {
        return denunciasReponse.denunciasFis;
      } else {
        return denunciasReponse.denunciasFin;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> crearDenuncia(
      String texto, String persona, String tipo, String autor) async {
    this.autenticando = true;

    final data = {
      "texto": texto,
      "autor": autor,
      "persona": persona,
      "tipo": tipo,
    };

    final resp = await http.post('${Environment.apiUrl}/denuncias',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.autenticando = false;

    if (resp.statusCode == 200) {
      final denunciaResponse = denunciaResponseFromJson(resp.body);
      //final denunciaResponse = DenunciaResponse.fromJson(jsonDecode(resp.body));

      this.denuncia = denunciaResponse.denuncia;
      return true;
    } else {
      return false;
    }
  }

  Future<Denuncia> getDenuncia(String uid) async {
    final resp = await http.get(
        '${Environment.apiUrl}/denuncias/denuncia' + uid,
        headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final denunciaResponse = denunciaResponseFromJson(resp.body);
      return denunciaResponse.denuncia;
    } else {
      return null;
    }
  }
}
