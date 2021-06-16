
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppBarUserWidgets extends PreferredSize {
  final user = FirebaseAuth.instance.currentUser;
 
  @override
  AppBarUserWidgets()
      : super(
          preferredSize: Size.fromHeight(150),
          child: Container(
            height: 250,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/fundo_user.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Container(
                    margin: const EdgeInsets.only(top: 70),
                  ),
                  Text(
                    'Davidson Eustaquio',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Seu saldo: ' + ' créditos',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ]),
          ),
        );
}
