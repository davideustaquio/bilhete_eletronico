/* import 'package:bilhete_eletronico/models/card.dart';
import 'package:bilhete_eletronico/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class CardModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  int _cardID;
  int _numerocard;
  double _saldo;
  String _clienteID;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  int get cardID => _cardID;
  int get numerocard => _numerocard;
  double get saldo => _saldo;
  String get clienteID => clienteID;

  setCardID(String cardID) {
    _cardID = int.parse(cardID);
    notifyListeners();
  }

  setNumerocard(String numerocard) {
    _numerocard = int.parse(numerocard);
  }

  setSaldo(double saldo) {
    _saldo = saldo;
    notifyListeners();
  }

  setClienteID(String clienteID) {
    _clienteID = clienteID;
    notifyListeners();
  }

  loadCard(Card card) {
    _cardID = cardID;
    _numerocard = numerocard;
    _saldo = saldo;
    _clienteID = card.clienteID;
  }

  saveCard() {
    //CREATE
    if (_cardID == null) {
      var novoCard = Card(
        numerocard: numerocard,
        saldo: saldo,
        clienteID: clienteID,
        cardID: uuid.v4(),
      );
      firestoreservice.saveCard(novoCard);
    } else {
      //UPDATE
      var alteraCard =
          Card(clienteID: _clienteID, cardID: cardID, saldo: saldo);
      firestoreservice.saveCliente(alteraCliente);
    }
  }

  removeCliente(String clienteID) {
    firestoreservice.removeCliente(clienteID);
  }
}
 */