import 'package:bilhete_eletronico/screens/login_page.dart';
import 'package:bilhete_eletronico/screens/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image(image: AssetImage('images/fundo_app.png'));
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('images/fundo_app.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 160),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('images/logo_bilhete.png'),
              ],
            ),
          ),
          new Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 400),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 50.0, top: 15.0, right: 50.0, bottom: 15.0),
                    primary: Colors.green[600],
                    onPrimary: Colors.white,
                    shadowColor: Colors.green,
                    elevation: 20,
                  ),
                  child: Text(
                    'ENTRAR',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 20.0, top: 0, right: 20.0, bottom: 0),
                      primary: Colors.green[700],
                      onPrimary: Colors.white,
                      shadowColor: Colors.green,
                      elevation: 0,
                    ),
                    child: Text('CADASTRAR')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
