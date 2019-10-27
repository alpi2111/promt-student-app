import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/pages/index_alumno.dart';

import 'package:promt_estudent_app/src/pages/index_padre.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'src/pages/login_page.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  //await initCon();
  /*final con = new Con();
  con.initCon();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: (_prefs.token == null)
          ? 'login'
          : (_prefs.tipoUsuario == "padre") ? 'index_padre' : 'index_alumno',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'index_padre': (BuildContext context) => BottomNavBar(),
        'index_alumno': (BuildContext context) => IndexAlumno(),
      },
    );
    return materialApp;
  }
}
