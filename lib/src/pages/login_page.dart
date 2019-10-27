import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/providers/here_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final here = new HereProvider();

  @override
  Widget build(BuildContext context) {
    here.pos;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}