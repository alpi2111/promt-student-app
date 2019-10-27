import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';

class Historial extends StatefulWidget {
  @override
  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  final _pref = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('historial'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _pref.token = null;
          },
          child: Text('Cerrar sesion'),
        ),
      ),
    );
  }
}