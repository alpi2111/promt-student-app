import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/pages/index_alumno.dart';

import 'package:promt_estudent_app/src/pages/index_padre.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:promt_estudent_app/src/providers/push_notification_provider.dart';
import 'src/pages/login_page.dart';


//TODO token fcm fC9xy3xLHBA:APA91bFLFFtLGT1I2i3nNCmgYCZ7rU2kD8RE6QVtzEtR5FBft_PjlUTHI_2JhnUy_yELRx7xaAyVTkbrxpCYwfUhhXBvWX1L9j9DTEt7fBE2V_6IgFgnfz_h9gGofZdR5blUg7J_EZBn

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  //await initCon();
  /*final con = new Con();
  con.initCon();*/
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();
  }

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
