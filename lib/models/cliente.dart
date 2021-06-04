class Cliente {
  final String clienteId;
  final String cartaobilhete;
  final String cpf;
  final String nome;
  final String email;
  final String celular;

  Cliente(
      {this.clienteId,
      this.cartaobilhete,
      this.cpf,
      this.nome,
      this.email,
      this.celular});

  Map<String, dynamic> toMap() {
    return {
      'produtoId': clienteId,
      'cartaobilhete': cartaobilhete,
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'celular': celular
    };
  }

  Cliente.fromFirestore(Map<String, dynamic> firestoredocument)
      : clienteId = firestoredocument['clienteId'],
        cartaobilhete = firestoredocument['cartaobilhete'],
        cpf = firestoredocument['cpf'],
        nome = firestoredocument['nome'],
        email = firestoredocument['email'],
        celular = firestoredocument['celular'];
}
