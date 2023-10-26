import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/activity/worker.dart';
import 'location.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = ' ';
  late String description;
  late String wind;
  late String temp;
  late String icon;
  late int hum;
  int i = 1;

  startApp(city) async {
    if (i == 1) {
      CurrentW obj = CurrentW();
      await obj.loc();

      String cityName = obj.current_city;
      city = cityName;
      setState(() {
        i = 2;
      });
    }
    FatchData instence = FatchData(city);
    await instence.getData();
    description = instence.description;
    city = instence.city;
    wind = instence.wind;
    temp = instence.temp;
    icon = instence.icon;
    hum = instence.hum;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "d": description,
      "c": city,
      "w": wind,
      "t": temp,
      "i": icon,
      "h": hum
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startApp(city);
  }

  @override
  Widget build(BuildContext context) {
    Map searchC = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    if (searchC.isNotEmpty) {
      city = searchC["searchText"];
      startApp(city);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 240,
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/gif2.jpg'), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitFadingCircle(
              color: Colors.black54,
              size: 50.0,
            ),
            SizedBox(
              height: 50,
            ),
            Text("powered by SMP",
                style: TextStyle(
                  color: Colors.white,
                ))
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
