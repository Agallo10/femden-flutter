import 'dart:convert';

import 'package:femden/global/environment.dart';
import 'package:femden/src/models/denuncias.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';

class DenunciasService with ChangeNotifier {
  getDenunciasID() async {
    final uid = await AuthService.getUidPersona();

    try {
      http.Response response = await http
          .get('${Environment.apiUrl}/denuncias/' + uid, headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final data = json.decode(response.body);

      final denunciasResponse = Denuncias.fromJsonList(data);

      return denunciasResponse.denuncias;
    } catch (e) {
      print(e);
    }
  }
}
