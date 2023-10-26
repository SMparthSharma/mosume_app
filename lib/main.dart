import 'package:flutter/material.dart';
import 'package:mausam/activity/home.dart';
import 'package:mausam/activity/loading.dart';
import 'package:mausam/activity/location.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/loading": (context) => Loading(),
      },
    );
  }
}
