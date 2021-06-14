//import 'package:bilhete_eletronico/models/cliente.dart';

class Cartao {
  final String cartaoId;
  final double saldo;
  final String clienteID;

  Cartao({this.cartaoId, this.saldo, this.clienteID});

  Map<String, dynamic> toMap() {
    return {'cartaoId': cartaoId, 'saldo': saldo, 'cliente': clienteID};
  }

  Cartao.fromFirestore(Map<String, dynamic> firestoredocument)
      : cartaoId = firestoredocument['cartaoId'],
        saldo = firestoredocument['saldo'],
        clienteID = firestoredocument['clienteID'];
}
