import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentW {
  double lat = 0.0;
  double lon = 0.0;
  String current_city = ' ';
  Future<void> loc() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    lat = position.latitude;
    lon = position.longitude;
    var rawResult = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=ecc6056320a6dcc485dce1556428488d'));
    Map result = jsonDecode(rawResult.body.toString());
    current_city = result['name'];
  }
}
