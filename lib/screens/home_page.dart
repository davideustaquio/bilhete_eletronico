import 'package:bilhete_eletronico/screens/login_page.dart';
import 'package:bilhete_eletronico/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool _isProcessing = false;
  void initState() {
    User user = FirebaseAuth.instance.currentUser;

    /*if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            user: user,
          ),
        ),
      );
    }*/
    super.initState();
  }

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
            margin: const EdgeInsets.only(top: 160, left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/logo_bilhete.png',
                  width: 350,
                  height: 200,
                ),
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
                    //utilizar OutlinedButton como opção
                    onPressed: () {
                      Navigator.of(context).push(
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
