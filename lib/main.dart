import 'package:flutter/material.dart';

import 'package:promt_estudent_app/src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
      },
    );
  }
}