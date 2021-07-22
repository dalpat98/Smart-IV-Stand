import 'package:flutter/material.dart';
import 'package:medi_squad/home.dart';
import 'package:medi_squad/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: "Smart IV Stand",
      initialRoute: '/start',
      routes: {
        '/start': (context) => Start(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
