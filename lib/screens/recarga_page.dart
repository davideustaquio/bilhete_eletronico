import 'dart:io';

import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/providers/cliente_model.dart';
import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/widgets/appBarUser_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecargaPage extends StatefulWidget {
  final Cliente cliente;

  RecargaPage([this.cliente]);

  @override
  _RecargaPageState createState() => _RecargaPageState();
}

class _RecargaPageState extends State<RecargaPage> {
  //
  final nomecontroller = TextEditingController();
  final cpfcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final celularcontroller = TextEditingController();
  final numerocartaocontroller = TextEditingController();
  final senhaController = TextEditingController();
  final saldocontroller = TextEditingController();
  //
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = FirebaseAuth.instance.currentUser;
  bool _isProcessing = false;

  //verifica se vem algo ou não do banco
  @override
  void initState() {
    if (widget.cliente != null) {
      nomecontroller.text = widget.cliente.nome;
      cpfcontroller.text = widget.cliente.cpf.toString();
      emailcontroller.text = widget.cliente.email;
      celularcontroller.text = widget.cliente.celular.toString();
      numerocartaocontroller.text = widget.cliente.numerocartao.toString();
      //senhaController.text = widget.cliente.senha.toString();
      saldocontroller.text = widget.cliente.saldo.toString();

      final clienteprovider = Provider.of<ClienteModel>(context, listen: false);
      clienteprovider.loadCliente(widget.cliente);
    }
    super.initState();
  }

  Future<void> _alertDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('CONFIRMAÇÃO DE RECARGA'),
            title: Text('Verifique o valor desejado.'),
            // entra algo aqui//
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClientePage(),
                    ),
                  );
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('CANCELAR'),
              ),
            ],
          );
        })) {
    }
  }

  @override
  Widget build(BuildContext context) {
    final clienteprovider = Provider.of<ClienteModel>(context);
    User user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBarUserWidgets(),
      body: Form(
        key: _formKey,
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Text(
                    "RECARGA DO BILHETE ELETRÔNICO",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.black26),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'ESCOLHA UM VALOR:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RawMaterialButton(
                          onPressed: () {
                            clienteprovider.setSaldo('20');
                          },
                          elevation: 3.0,
                          child: Text('20'),
                          fillColor: Colors.green,
                          padding: EdgeInsets.all(30),
                          shape: CircleBorder()),
                      SizedBox(
                        width: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          clienteprovider.setSaldo("40,00");
                        },
                        elevation: 3.0,
                        fillColor: Colors.green,
                        child: Text('40'),
                        padding: EdgeInsets.all(30),
                        shape: CircleBorder(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          clienteprovider.setSaldo("80");
                        },
                        elevation: 3.0,
                        child: Text('80'),
                        fillColor: Colors.green,
                        padding: EdgeInsets.all(30),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: <Widget>[
                      Text('OUTRO VALOR:',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      TextFormField(
                        onChanged: (value) => {clienteprovider.setNome(value)},
                        validator: (value) {
                          return value == ""
                              ? "Digite o valor desejado."
                              : null;
                        },
                        controller: saldocontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Digite o valor desejado.",
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
//
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[200],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 0,
                                      ),
                                      child: Text('CANCELAR')),
                                ),
                                SizedBox(width: 25.0),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                      } else {
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      }
                                      _alertDialog();
                                    },
                                    child: Text('CONTINUAR'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green[600],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 5),
                                  ),
                                ),
                              ],
                            ),
//
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
/* import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/providers/cliente_model.dart';
import 'package:bilhete_eletronico/screens/cliente_page.dart';
import 'package:bilhete_eletronico/widgets/appBarUser_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecargaPage extends StatefulWidget {
  //User user = FirebaseAuth.instance.currentUser;
  // final Cliente cliente;

  RecargaPage([user]);

  @override
  _RecargaPageState createState() => _RecargaPageState();
}

class _RecargaPageState extends State<RecargaPage> {
  //controller
  final valorcontroller = TextEditingController();
  bool _isProcessing = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    valorcontroller.text = "";
    final clienteprovider = Provider.of<ClienteModel>(context, listen: false);
    clienteprovider.loadCliente(Cliente());
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clienteprovider = Provider.of<ClienteModel>(context);
    User user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBarUserWidgets(),
      body: Form(
        key: _formKey,
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Text(
                    "RECARGA DO BILHETE ELETRÔNICO",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.black26),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'ESCOLHA UM VALOR:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RawMaterialButton(
                          onPressed: () {
                            clienteprovider.setSaldo('20');
                          },
                          elevation: 3.0,
                          child: Text('20'),
                          fillColor: Colors.green,
                          padding: EdgeInsets.all(30),
                          shape: CircleBorder()),
                      SizedBox(
                        width: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          clienteprovider.setSaldo("40,00");
                        },
                        elevation: 3.0,
                        fillColor: Colors.green,
                        child: Text('40'),
                        padding: EdgeInsets.all(30),
                        shape: CircleBorder(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          clienteprovider.setSaldo("80");
                        },
                        elevation: 3.0,
                        child: Text('80'),
                        fillColor: Colors.green,
                        padding: EdgeInsets.all(30),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: <Widget>[
                      Text('OUTRO VALOR:',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      TextFormField(
                        validator: (value) {
                          return value == ""
                              ? "Digite o valor desejado."
                              : null;
                        },
                        controller: valorcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Digite o valor desejado.",
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
//
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green[200],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 0,
                                      ),
                                      child: Text('CANCELAR')),
                                ),
                                SizedBox(width: 25.0),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        //salvando no bd
                                        clienteprovider
                                            .setSaldo(valorcontroller.text);
                                        clienteprovider.saveCliente();
                                      } else {
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      }
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ClientePage(),
                                        ),
                                      );
                                    },
                                    child: Text('CONTINUAR'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green[600],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 5),
                                  ),
                                ),
                              ],
                            ),
//
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */
