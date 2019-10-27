import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class HereProvider {
  static final HereProvider _instance = new HereProvider._();

  factory HereProvider() {
    return _instance;
  }

  HereProvider._();

  final _urlApi = "https://pos.api.here.com/positioning/v1/locate";
  final _appId = "WojTB51jfVcCgxLzrT1C";
  final _appCode = "k7OnAi_0iaqMCszEllhstg";

  get pos async {
    /*
    final url =
        "https://pos.api.here.com/positioning/v1/locate?app_id=WojTB51jfVcCgxLzrT1C&app_code=k7OnAi_0iaqMCszEllhstg";

    final bod = '{"gsm": [{"mcc": 262, "mnc": 1, "lac": 5126, "cid": 21857}]}';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };

    final resp = await http.post(url, body: bod, headers: headers);

    print(resp.headers);

    final decodedResp = json.decode(resp.body);

    print(decodedResp);*/

    final Location location = new Location();
    final perm = await location.requestPermission();
    if (perm) {
      final pos = await location.getLocation();
      print(pos.latitude);
      print(pos.longitude);
    } else {
      print('Denegado');
    }
  }
}
