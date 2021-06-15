import 'package:bilhete_eletronico/models/card.dart';
import 'package:bilhete_eletronico/models/cliente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //
  //________________________________________________________
  //__________________CLIENTE_______________________________
  //CRUD
  //criar - atualizar
  Future<void> saveCliente(Cliente cliente) {
    return _db
        .collection(
            'clientes') //EM QUAL COLEÇÃO VOU QUERER ALTERAR, NO CASO 'clientes'
        .doc(cliente.clienteID) //EM QUAL DOCUMENTO EU QUERO ALTERAR
        .set(cliente.toMap()); // O MÉTODO toMap(); veio da classe cliente
  }

  //ler-consultar
  Stream<List<Cliente>> getClientes() {
    return _db.collection('clientes').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Cliente.fromFirestore(document.data()))
        .toList());
  }

  //remover
  Future<void> removeCliente(String clienteID) {
    return _db.collection('clienteID').doc(clienteID).delete();
  }

  //
  //________________________________________________________
  //__________________CARD__________________________________
  //criar - atualizar
  /*  Future<void> saveCard(Card card) {
    return _db.collection('cards').doc(card.cardID).set(card.toMap());
  }

  //ler-consultar
  Stream<List<Card>> getCards() {
    return _db.collection('cards').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Card.fromFirestore(document.data()))
        .toList());
  }

  //remover
  Future<void> removeCard(String cardID) {
    return _db.collection('cardID').doc(cardID).delete();
  } */
}
