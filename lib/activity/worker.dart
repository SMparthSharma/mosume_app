import 'dart:convert';
import 'package:http/http.dart';

class FatchData {
  FatchData(this.city);
  late String description;
  String city;
  late String wind;
  late String temp;
  late String icon;
  late int hum;

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e34a5eb0b4c5ff748fdf9219a63d224e&units=metric"));
    Map data = jsonDecode(response.body);
    String get_description = data['weather'][0]['description'];
    double get_wind = data['wind']['speed'] / 0.27777777777778;
    String get_icon = data['weather'][0]['icon'];
    String get_temp = data['main']['feels_like'].toStringAsFixed(1);
    int get_hum = data['main']['humidity'];
    String get_city = data['name'];

    description = get_description;
    city = get_city;
    wind = get_wind.toStringAsFixed(1);
    temp = get_temp;
    hum = get_hum;
    icon = get_icon;
  }
}
