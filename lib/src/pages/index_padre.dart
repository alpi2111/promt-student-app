import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:promt_estudent_app/src/fragment_menu_padre/historial.dart';
import 'package:promt_estudent_app/src/fragment_menu_padre/inicio_principal.dart';
import 'package:promt_estudent_app/src/fragment_menu_padre/localizacion.dart';
import 'package:promt_estudent_app/src/fragment_menu_padre/otrapagina.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final InicioPrincipal _inicioPrincipal = InicioPrincipal();
  final Historial _historial = Historial();
  final Localizacion _localizacion = Localizacion();
  final OtraPagina _otraPagina = OtraPagina();

  Widget _showPage = new InicioPrincipal();

  Widget _pagechoser(int page) {
    switch (page) {
      case 0:
        return _inicioPrincipal;
        break;
      case 1:
        return _historial;
        break;
      case 2:
        return _localizacion;
        break;
      case 3:
        return _otraPagina;
        break;
      default:
        return new Container(
          child: new Center(
              child: new Text('No se encontro la pagina seleccionada')),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          //index: _page,

          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.history, size: 30),
            Icon(Icons.map, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        /*body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                RaisedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));*/
        body: _pagechoser(_page),
    );
  }
}
