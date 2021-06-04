import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //CRUD
  //criar - atualizar
  Future<void> createUsuario(Cliente cliente) {
    return _db
        .collection('cliente')
        .doc(cliente.clienteId)
        .set(cliente.toMap());
  }

  //ler-consultar
  Stream<List<Cliente>> getClientes() {
    return _db.collection('clientes').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Cliente.fromFirestore(document.data()))
        .toList());
  }

  //remover
  Future<void> removeUsuario(String clienteId) {
    return _db.collection('cliente').doc(clienteId).delete();
  }
}
