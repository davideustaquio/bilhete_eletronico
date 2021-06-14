import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoService {
  static Future<User> registrarCliente(
      {String nome,
      String email,
      String senha,
      String cpf,
      String celular,
      String cartaoID}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      user = userCredential.user;
      await user.updateProfile(displayName: nome);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('Senha inválida');
      } else if (e.code == 'email already-in-use') {
        print('Email existente');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  //login
  static Future<User> signInCliente({String email, String senha}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: senha);
      user = userCredential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuario não encontrado');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta');
      }
    } catch (e) {
      print(e.toString());
    }
    return user;
  }

  //logOut
  static Future<User> signOutCliente(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }
}
