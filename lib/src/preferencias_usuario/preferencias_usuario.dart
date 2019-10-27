import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del usuario
  get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String value) {
    _prefs.setString('usuario', value);
  }

  get token {
    return _prefs.getString('token') ?? null;
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  get tokenFcm {
    return _prefs.getString('tokenFcm') ?? null;
  }

  set tokenFcm(String token) {
    _prefs.setString('tokenFcm', token);
  }
}
