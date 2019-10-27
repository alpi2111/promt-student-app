import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';

class LoginProvider {
  final _firebaseToken = 'AIzaSyDRv5Qu1pdqCN9IwiSUjMiDwzExw_hiYcU';
  final _prefs = new PreferenciasUsuario();
  //final _correoAdmin = 'supervisor_matriz@rajuma.com';

  //final String _url = "https://zeos-app.firebaseio.com";

  Future<Map<String, dynamic>> iniciarSesion(String usuario, String pass) async {
    final authData = {
      'email': usuario,
      'password': pass,
      'returnSecureToken': true
    };

    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken';

    try {
      
      final resp = await http.post(url, body: json.encode(authData));

      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      //print(decodedResp);

      if (decodedResp.containsKey('idToken')) {
        _prefs.token = decodedResp['idToken'];
        _prefs.usuario = decodedResp['email'];
        if(decodedResp['email'].toString().contains("padre")) {
          //print('padre');
          _prefs.tipoUsuario = "padre";
        } else if(decodedResp['email'].toString().contains("alumno")) {
          //print('no padre');
          _prefs.tipoUsuario = "alumno";
        }
        //_prefs.usuario;
        return {'ok': true, 'token': decodedResp['idToken']};
      } else {
        return {'ok': false, 'mensaje': decodedResp['error']['message']};
      }

    } catch (e) {
      //print(e);
      return {'ok':false, 'mensaje': 'Failed $e'};
    }
  }
}
