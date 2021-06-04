import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class ClienteModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  String _clienteId;
  String _cartaobilhete;
  String _cpf;
  String _nome;
  String _email;
  String _celular;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  String get cpf => _cpf;
  String get nome => _nome;
  String get email => _email;
  String get celular => _celular;
  String get cartaobilhete => _cartaobilhete;

  setCpf(String xcpf) {
    _nome = xcpf;
    notifyListeners();
  }

  setNome(String xnome) {
    _nome = xnome;
    notifyListeners();
  }

  setEmail(String xemail) {
    _email = xemail;
    notifyListeners();
  }

  setCelular(String xcelular) {
    _celular = xcelular;
    notifyListeners();
  }

  setCartaobilhete(String xcartaobilhete) {
    _nome = xcartaobilhete;
    notifyListeners();
  }

  loadProduto(Cliente cliente) {
    _cpf = cliente.cpf;
    _nome = cliente.nome;
    _email = cliente.email;
    _celular = cliente.celular;
    _clienteId = cliente.clienteId;
    _cartaobilhete = cliente.cartaobilhete;
  }

  createCliente() {
    //CREATE
    if (_clienteId == null) {
      var novoUsuario = Cliente(
          nome: nome, email: email, celular: celular, clienteId: uuid.v4());
      firestoreservice.createUsuario(novoUsuario);
    } else {
      //UPDATE
      var alteraCliente = Cliente(
          nome: nome, celular: celular, email: email, clienteId: _clienteId);
      firestoreservice.createUsuario(alteraCliente);
    }
  }

  removeCliente(String clienteId) {
    firestoreservice.removeUsuario(clienteId);
  }
}
