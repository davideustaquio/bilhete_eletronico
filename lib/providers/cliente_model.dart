import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
//import 'package:uuid/uuid.dart';

class ClienteModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  int _numerocartao;
  String _clienteID;
  int _cpf;
  String _nome;
  String _email;
  int _celular;
  double _saldo;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  int get numerocartao => _numerocartao;
  double get saldo => _saldo;
  String get clienteID => _clienteID;
  int get cpf => _cpf;
  String get nome => _nome;
  String get email => _email;
  int get celular => _celular;

  setnumerocartao(String numerocartao) {
    _numerocartao = int.parse(numerocartao);
    notifyListeners();
  }

  setSaldo(String saldo) {
    _saldo = double.parse(saldo);
    notifyListeners();
  }

  setClienteID(String clienteID) {
    _clienteID = clienteID;
    notifyListeners();
  }

  setCpf(String cpf) {
    _cpf = int.parse(cpf);
    notifyListeners();
  }

  setNome(String nome) {
    _nome = nome;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setCelular(String celular) {
    _celular = int.parse(celular);
    notifyListeners();
  }

  loadCliente(Cliente cliente) {
    _cpf = cliente.cpf;
    _nome = cliente.nome;
    _email = cliente.email;
    _celular = cliente.celular;
    _clienteID = cliente.clienteID;
    _numerocartao = cliente.numerocartao;
    _saldo = cliente.saldo;
  }

  saveCliente() {
    //CREATE
    if (_clienteID == null) {
      var novoCliente = Cliente(
          nome: nome,
          cpf: cpf,
          email: email,
          celular: celular,
          clienteID: uuid.v4(),
          numerocartao: numerocartao,
          saldo: saldo);
      firestoreservice.saveCliente(novoCliente);
    } else {
      //UPDATE
      var alteraCliente = Cliente(
          nome: nome,
          cpf: cpf,
          celular: celular,
          email: email,
          clienteID: _clienteID,
          numerocartao: numerocartao,
          saldo: saldo);
      firestoreservice.saveCliente(alteraCliente);
    }
  }

  removeCliente(String clienteID) {
    firestoreservice.removeCliente(clienteID);
  }
}
