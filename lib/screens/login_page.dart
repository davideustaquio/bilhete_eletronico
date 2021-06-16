import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/screens/home_page.dart';
import 'package:bilhete_eletronico/screens/register_page.dart';
import 'package:bilhete_eletronico/services/autenticacao_service.dart';
import 'package:bilhete_eletronico/validaEmail/valida_email.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailTextController = TextEditingController();
  final _senhaTextController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  bool _isProcessing = false;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Image(image: AssetImage('images/fundo_app.png'));
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('images/fundo_app.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logo_bilhete.png",
                    width: 350,
                    height: 200,
                  ),
                  SizedBox(height: 110.0),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          hintText: "Email",
                        ),
                        validator: (value) {
                          return ValidaEmail.validaEmail(value);
                        },
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: _senhaTextController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Senha",
                        ),
                        validator: (value) {
                          return value == "" ? "Digite uma senha" : null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[700],
                                        onPrimary: Colors.white,
                                        //shadowColor: Colors.green,
                                        elevation: 0,
                                      ),
                                      child: Text('VOLTAR')),
                                ),
                                SizedBox(width: 25.0),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        if (_formKey.currentState.validate()) {
                                          User user = await AutenticacaoService
                                              .signInCliente(
                                            email: _emailTextController.text,
                                            senha: _senhaTextController.text,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (user != null) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientePage(),
                                              ),
                                            );
                                          }
                                        } else {
                                          showAlertDialog1(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[600],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 5,
                                      ),
                                      child: Text('ENTRAR')),
                                ),
                                SizedBox(width: 25.0),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}

void showAlertDialog1(BuildContext context) {
  // botao
  Widget botao = ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green[700],
        onPrimary: Colors.white,
        //shadowColor: Colors.green,
        elevation: 0,
      ),
      child: Text('VOLTAR'));
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Usuário e/ou senha incorretos."),
    actions: [
      botao,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
