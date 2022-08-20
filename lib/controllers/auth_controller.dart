import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  AuthController._();

  static final AuthController _instance = AuthController._();

  static AuthController get instance => _instance;

  final _auth = FirebaseAuth.instance;

  Stream<User?> userAuthState() {
    return _auth.authStateChanges();
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
