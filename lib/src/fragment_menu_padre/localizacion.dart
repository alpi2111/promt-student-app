import 'package:flutter/material.dart';
import 'package:promt_estudent_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:promt_estudent_app/src/providers/here_provider.dart'; 

class Localizacion extends StatelessWidget {
  final pref = PreferenciasUsuario();
  final here = new HereProvider();
  @override
  Widget build(BuildContext context) {
    //here.mostrarMapa([]);
    //final lat = "", lon = "";
    //final pos = here.pos;
    //print(pos);
    //print(pos['lat']);
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: FutureBuilder(
        future: here.pos(),
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          return ListView.builder(
            //itemBuilder: snapshot.data.length,
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              return Center(
                child: Text('Lat: ${snapshot.data[i]}'),
              );
            },
          );
        },
      ),
    );
  }
}