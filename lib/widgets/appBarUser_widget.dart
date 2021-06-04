import 'package:flutter/material.dart';

class AppBarUserWidgets extends PreferredSize {
  AppBarUserWidgets()
      : super(
          preferredSize: Size.fromHeight(150),
          child: Container(
            // height: 250,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/fundo_user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
}
