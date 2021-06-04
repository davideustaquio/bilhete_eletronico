import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/screens/home_page.dart';
import 'package:bilhete_eletronico/services/autenticacao_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;
    //...//
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Image(image: AssetImage('images/fundo_app.png'));
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('images/fundo_app.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo_bilhete.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 110.0),
            Column(
              children: <Widget>[
                TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
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

                                  User user =
                                      await AutenticacaoService.signInCliente(
                                    email: _emailTextController.text,
                                    senha: _passwordTextController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => ClientePage(),
                                      ),
                                    );
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
                        ],
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/* 

            

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 180),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "cpf",
                    labelStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Número do cartão do Bilhete Eletronico",
                    labelStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          /////////
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
                            onPrimary: Colors.green[100],
                            shadowColor: Colors.black26,
                            elevation: 5,
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

                            User user = await AutenticacaoService.signInCliente(
                              email: _emailTextController.text,
                              senha: _passwordTextController.text,
                            );

                            setState(() {
                              _isProcessing = false;
                            });

                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(), //alterar esta rota ainda
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[700],
                            onPrimary: Colors.green[100],
                            shadowColor: Colors.black26,
                            elevation: 5,
                          ),
                          child: Text('ENTRAR')),
                    ),
                  ],
                ),

          /*           Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [
                  Color(0xFF244AF5),
                  Color(0XFFF92B7F),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: SizedBox.expand(
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      child: SizedBox(
                        child: Image.asset("assets/"),
                        height: 28,
                        width: 28,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Inicial(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFF3C5A99),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: TextButton(
              child: Text(
                "Cadastre-se",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ), */

          //
        ],
      ),
    );
  }
}
 */
