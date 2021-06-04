import 'package:bilhete_eletronico/widgets/appBarUser_widget.dart';
import 'package:flutter/material.dart';

class HorarioPage extends StatefulWidget {
  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUserWidgets(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "FALTA IMPLEMETAR",
          )
        ]),
      ),
    );
  }
}
