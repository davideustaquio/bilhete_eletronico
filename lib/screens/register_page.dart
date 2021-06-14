import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/providers/cartao_models.dart';
import 'package:bilhete_eletronico/services/autenticacao_service.dart';
import 'package:bilhete_eletronico/validaEmail/valida_email.dart';
import 'package:bilhete_eletronico/widgets/appBar_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Cliente cliente;

  RegisterPage([this.cliente]); //construtor como opcional passando o cliente

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  final nomecontroller = TextEditingController();
  final cpfcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final celularcontroller = TextEditingController();
  final cartaoIDcontroller = TextEditingController();
  final senhaController = TextEditingController();

  //verifica se vem algo ou não do banco
  @override
  void initState() {
    if (widget.cliente == null) {
      //novoCliente
      nomecontroller.text = "";
      cpfcontroller.text = "";
      emailcontroller.text = "";
      celularcontroller.text = "";
      cartaoIDcontroller.text = "";
      senhaController.text = "";

      final clienteprovider = Provider.of<ClienteModel>(context, listen: false);
      clienteprovider.loadCliente(Cliente());
    } else {
      //alterar cliente
      nomecontroller.text = widget.cliente.nome;
      cpfcontroller.text = widget.cliente.cpf.toString();
      emailcontroller.text = widget.cliente.email;
      celularcontroller.text = widget.cliente.celular.toString();
      cartaoIDcontroller.text = widget.cliente.cartaoID.toString();
      senhaController.text = widget.cliente.senha.toString();

      final clienteprovider = Provider.of<ClienteModel>(context, listen: false);
      clienteprovider.loadCliente(widget.cliente);
    }
    super.initState();
  }

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    //final clienteprovider = Provider.of<ClienteModel>(context);
    return Scaffold(
      appBar: AppBarWidgets(
          // centerTitle: true,
          // title: Text("Bilhete Eletronico"),
          ),
      body: Form(
        key: _formKey,

        //color: Colors.white,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nomecontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Nome",
                        ),
                        validator: (value) {
                          return value.isEmpty
                              ? "Digite seu nome completo."
                              : null;
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: cpfcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "CPF",
                        ),
                        validator: (value) {
                          return value.isEmpty ? "Digite seu CPF." : null;
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                        ),
                        validator: (value) {
                          return ValidaEmail.validaEmail(value);
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: celularcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Celular",
                        ),
                        validator: (value) {
                          return value.isEmpty
                              ? "Digite o número do se celular."
                              : null;
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        //obscureText: true,
                        controller: cartaoIDcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Número do cartão do bilhete eletrônico",
                        ),
                        validator: (value) {
                          return value.isEmpty
                              ? "Digite número do bilhete eletrônico."
                              : null;
                        },
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        obscureText: true,
                        controller: senhaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Senha",
                        ),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return value.length < 7
                                ? "Senha com mínimo de 7 caracteres."
                                : null;
                          } else {
                            return "Digite uma senha";
                          }
                        },
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      if (_formKey.currentState.validate()) {
                                        User user = await AutenticacaoService
                                            .registrarCliente(
                                          nome: nomecontroller.text,
                                          email: emailcontroller.text,
                                          cpf: cpfcontroller.text,
                                          celular: celularcontroller.text,
                                          cartaoID: cartaoIDcontroller.text,
                                          senha: senhaController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Cadastro Concluído.'),
                                            ),
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      } else {
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      }
                                    },
                                    child: Text('CADASTRAR'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green[600],
                                        onPrimary: Colors.white,
                                        shadowColor: Colors.green,
                                        elevation: 5),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
