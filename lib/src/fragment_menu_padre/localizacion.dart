import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart'; 

class Localizacion extends StatelessWidget {
  final pref = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            pref.token = null;
          },
          child: Text('Cerrar sesion'),
        ),
      ),
    );
  }
}