import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
//import 'package:uuid/uuid.dart';

class ClienteModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  int _cartaoID;
  String _clienteID;
  int _cpf;
  String _nome;
  String _email;
  int _celular;
  double _saldo;
  //var uuid = Uuid();

  //GETTERS AND SETTERS
  int get cartaoID => _cartaoID;
  double get saldo => _saldo;

  String get clienteID => _clienteID;
  int get cpf => _cpf;
  String get nome => _nome;
  String get email => _email;
  int get celular => _celular;

  setCartaoID(String cartaoID) {
    _cartaoID = int.parse(cartaoID);
    notifyListeners();
  }

  setSaldo(double saldo) {
    _saldo = saldo;
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

  loadCliente(Cliente cartao) {
    _cpf = cartao.cpf;
    _nome = cartao.nome;
    _email = cartao.email;
    _celular = cartao.celular;
    _clienteID = cartao.clienteID;
    _cartaoID = cartaoID;
    _saldo = saldo;
  }

  saveCliente() {
    //CREATE
    if (_clienteID == null) {
      var novoCliente = Cliente(
          nome: nome,
          email: email,
          celular: celular,
          clienteID: clienteID,
          cartaoID: cartaoID,
          saldo: saldo);
      firestoreservice.saveCliente(novoCliente);
    } else {
      //UPDATE
      var alteraCliente = Cliente(
          nome: nome,
          celular: celular,
          email: email,
          clienteID: _clienteID,
          cartaoID: cartaoID,
          saldo: saldo);
      firestoreservice.saveCliente(alteraCliente);
    }
  }

  removeCliente(String clienteID) {
    firestoreservice.removeCliente(clienteID);
  }
}
