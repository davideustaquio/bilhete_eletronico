class Cliente {
  final String clienteID;
  final int cpf;
  final String nome;
  final String email;
  final int celular;
  //final String senha;
  final int numerocartao;
  final double saldo;

  Cliente(
      {this.clienteID,
      this.cpf,
      this.nome,
      this.email,
      this.celular,
      //this.senha,
      this.numerocartao,
      this.saldo});

  Map<String, dynamic> toMap() {
    return {
      'clienteID': clienteID,
      'cpf': cpf,
      'nome': nome,
      'email': email,
      'celular': celular,
      //'senha': senha,
      'numerocartao': numerocartao,
      'saldo': saldo
    };
  }

  Cliente.fromFirestore(Map<String, dynamic> firestoredocument)
      : clienteID = firestoredocument['clienteID'],
        cpf = firestoredocument['cpf'],
        nome = firestoredocument['nome'],
        email = firestoredocument['email'],
        celular = firestoredocument['celular'],
       // senha = firestoredocument['senha'],
        numerocartao = firestoredocument['numerocartao'],
        saldo = firestoredocument['saldo'];
}
