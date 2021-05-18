import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bilhete_eletronico/screens/Inicial.dart';
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
      home: Inicial(),
    );
  }
}
