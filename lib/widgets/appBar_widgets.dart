import 'package:flutter/material.dart';

class AppBarWidgets extends PreferredSize {
  AppBarWidgets()
      : super(
          preferredSize: Size.fromHeight(150),
          child: Container(
            // height: 250,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/fundo_app.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
}
