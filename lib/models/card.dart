/* //import 'package:bilhete_eletronico/models/cliente.dart';

class Card {
  final String cardID;
  final String numerocard;
  final double saldo;
  final String clienteID;

  Card({this.cardID, this.numerocard, this.saldo, this.clienteID});

  Map<String, dynamic> toMap() {
    return {
      'cardID': cardID,
      'numerocard': numerocard,
      'saldo': saldo,
      'clienteID': clienteID
    };
  }

  Card.fromFirestore(Map<String, dynamic> firestoredocument)
      : cardID = firestoredocument['cardID'],
        numerocard = firestoredocument['numerocard'],
        saldo = firestoredocument['saldo'],
        clienteID = firestoredocument['clienteID'];
}
 */