import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/src/models/denuncia.dart';
import 'package:femden/src/models/denuncia_response.dart';
import 'package:femden/src/models/denuncia_uid_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DenunciaService with ChangeNotifier {
  Denuncia denuncia;
  List<Denuncia> denuncias;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

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

  Future<List<Denuncia>> getDenunciasPorId() async {
    final uid = await AuthService.getUidPersona();

    try {
      final resp = await http.get('${Environment.apiUrl}/denuncias/${uid}',
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });
      print(resp.body);

      final denunciaUidResponse = denunciaUidResponseFromJson(resp.body);

      return denunciaUidResponse.denuncias;
    } catch (e) {
      return [];
    }
  }

  Future<bool> crearDenuncia(String texto, String persona, String estado,
      String tipo, DateTime fecha) async {
    this.autenticando = true;

    final data = {
      "texto": texto,
      "persona": persona,
      "estado": estado,
      "tipo": tipo,
      "fecha": fecha.toIso8601String(),
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
}
