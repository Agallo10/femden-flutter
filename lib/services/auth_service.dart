import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/src/models/crearp_response.dart';
import 'package:femden/src/models/login_response.dart';
import 'package:femden/src/models/persona.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  Persona persona;
  bool _autenticando = false;

  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String> getUidPersona() async {
    final _storage = new FlutterSecureStorage();
    final uid = await _storage.read(key: 'uid');
    return uid;
  }

  static Future<String> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  static Future<String> deleteUidPersona() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'uid');
  }

  Future<bool> login(String email, String documento) async {
    this.autenticando = true;

    final data = {'email': email, 'documento': documento};

    final resp = await http.post('${Environment.apiUrl}/loginPersonas',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.persona = loginResponse.persona;
      await this._guardarToken(loginResponse.token);
      await this._guardarUidPersona(loginResponse.persona.uid);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> crearPersonas(String nombre, String documento, String email,
      int telefono, String direccion) async {
    this.autenticando = true;

    final data = {
      'nombre': nombre,
      'documento': documento,
      'email': email,
      'telefono': telefono,
      'direccion': direccion
    };

    final resp = await http.post('${Environment.apiUrl}/personas',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.autenticando = false;

    if (resp.statusCode == 200) {
      final crearpResponse = crearpResponseFromJson(resp.body);
      this.persona = crearpResponse.persona;
      return true;
    } else {
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future _guardarUidPersona(String uid) async {
    return await _storage.write(key: 'uid', value: uid);
  }

  Future logout() async {
    return await _storage.delete(key: 'token');
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

    final resp = await http.get('${Environment.apiUrl}/loginPersonas/renew',
        headers: {'Content-Type': 'application/json', 'x-token': token});

    print(resp.body);

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.persona = loginResponse.persona;
      await this._guardarToken(loginResponse.token);
      await this._guardarUidPersona(loginResponse.persona.uid);
      return true;
    } else {
      this.logout();
      return false;
    }
  }
}
