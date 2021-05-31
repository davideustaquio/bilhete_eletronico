import 'package:bilhete_eletronico/screens/home.dart';
import 'package:bilhete_eletronico/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilhete Eletrônico Alfenas',
      home: LoginPage(),
    );
  }
}
