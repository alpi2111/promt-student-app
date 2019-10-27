import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'login',
          routes: {
            'login' : (BuildContext context) => LoginPage(),
            'index_padre' : (BuildContext context) => BottomNavBar(),
          },
        );
        return materialApp;
  }
}