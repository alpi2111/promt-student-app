import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/models/login_model.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';
//import 'package:promt_estudent_app/src/providers/here_provider.dart';
import 'package:promt_estudent_app/src/providers/login_provider.dart';
import 'package:promt_estudent_app/src/utils/utils.dart';
class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  final _scaffoldKeyLogin = GlobalKey<ScaffoldState>();
  ////final here = new HereProvider();

  ////final a = connect.Connectivity();
  final _prefs = new PreferenciasUsuario();
  //final _raisedButtonKey = GlobalKey<ButtonState>();

  bool _passNoVisible = true;

  final LoginModel _login = new LoginModel();
  final LoginProvider _provider = new LoginProvider();
  //String _usuario = '';
  //String _pass = '';

  @override
  Widget build(BuildContext context) {
    ////here.pos;
    return Scaffold(
      key: _scaffoldKeyLogin,
      /*appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),*/
      body: _crearForm(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _crearForm() {
    return Form(
      key: _formLoginKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _crearLogo(),
              _crearUsuario(),
              SizedBox(height: 15.0),
              _crearPass(),
              SizedBox(height: 20.0),
              _crearBtnSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearUsuario() {
    return TextFormField(
      autocorrect: false,
      // style:TextStyle(
      //   color: Colors.white
      // ),
      decoration: InputDecoration(
        labelText: 'Usuario',
        icon: Icon(Icons.person),
      ),
      onSaved: (valor) {
        _login.usuario = '$valor@promt.app';
      },
      validator: (valor) {
        if (valor == '') {
          return 'Debe ingresar Datos';
        } else {
          return null;
        }
      },
      //textCapitalization: TextCapitalization.words,
    );
  }

  // TODO cambiar colores a los fomr de texto

  Widget _crearPass() {
    return TextFormField(
      autocorrect: false,
      //cursorColor: Colors.white,
      //style: Style ,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        icon: Icon(Icons.lock),
        suffixIcon: IconButton(
          tooltip: _passNoVisible ? 'Ver contraseña' : 'Ocultar contraseña',
          icon: _passNoVisible
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _passNoVisible = !_passNoVisible;
            });
          },
        ),
      ),
      obscureText: _passNoVisible,
      onSaved: (valor) {
        _login.password = valor;
      },
      validator: (valor) {
        if (valor == '') {
          return 'Debe ingresar Datos';
        } else {
          return null;
        }
      },
      //textCapitalization: TextCapitalization.words,
    );
  }

  //TODO eliminar este metodo de prueba para el boton
/*   Widget _crearBtnSubmit() {
    return RaisedButton(
      child: Text('Ir a home'),
      onPressed: () => Navigator.pushNamed(context, 'home_admin'),
    );
  } */

  //TODO usar este metodo en lugar del de arriba
  Widget _crearBtnSubmit() {
    return RaisedButton(
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(fontSize: 15.0),
      ),
      color: Colors.white,
      textColor: Colors.blueAccent,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      shape: StadiumBorder(),
      //  TODO:  Cambiar esta funcion por la real xD
      //onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
      onPressed: () => _hacerSubmit(),
    );
  }

  Widget _crearLogo() {
    final _style = TextStyle(
      fontSize: 50.0,
      color: Colors.white,
    );
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'P',
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
            Text(
              'R',
              style: _style,
            ),
            Icon(
              Icons.location_on,
              size: 50.0,
              color: Colors.white,
            ),
            Text(
              'M',
              style: _style,
            ),Text(
              'P',
              style: _style,
            ),Text(
              'T',
              style: _style,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          'Control de entrada y salida'.toUpperCase(),
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
      ],
    );
  }

  _hacerSubmit() async {
    if (!_formLoginKey.currentState.validate()) {
      mostrarSnackbar(_scaffoldKeyLogin, 'Algo anda mal...');
      return false;
    }
    _formLoginKey.currentState.save();

    mostrarAlertaProgreso(_scaffoldKeyLogin.currentContext, 'Cargando...');
    final dat = await _provider.iniciarSesion(_login.usuario, _login.password);

    if (dat != null) {
      Navigator.of(_scaffoldKeyLogin.currentContext, rootNavigator: true)
          .pop('dialog');
      //Navigator.pop(context);

      if (dat['ok']) {
        ////Navigator.of(context).pushReplacementNamed('home');
        Navigator.pushReplacementNamed(_scaffoldKeyLogin.currentContext, (_prefs.tipoUsuario == "alumno") ? 'index_alumno' : 'index_padre');
        ////Navigator.pushReplacementNamed(Scaffold.of(context).context, 'home');
        //Navigator.pop(context);
        //Navigator.of(context).pop();
        ////Navigator.of(_scaffoldKeyLogin.currentContext, rootNavigator: true).pushReplacementNamed('home');
      } else {
        //TODO hacer algo su el usuario no es correcto
        mostrarAlerta(context, 'Información inválida', dat['mensaje']);
        //return null;
      }
    } else {
      Navigator.of(_scaffoldKeyLogin.currentContext, rootNavigator: true)
          .pop('dialog');
      mostrarAlerta(context, 'Información',
          'Sin conexión a internet para iniciar sesión. Conéctese a internet e intente nuevamente');
    }
  }
}
