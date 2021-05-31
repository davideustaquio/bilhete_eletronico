import 'package:bilhete_eletronico/pages/login.dart';
import 'package:bilhete_eletronico/pages/register.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image(image: AssetImage('images/'));
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(left: 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('images/'),
              ],
            ),
          ),
          new Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    '   CADASTRAR   ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
