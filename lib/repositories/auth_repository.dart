import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // Registrar com e-mail e senha
  static Future registerWithEmailAndPassword(
      String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Entrar com e-mail e senha
  Future signInWithEmailAndPassword(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Fazer logout
  Future signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
