import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges.(
  //  (User user) => user.uid,
  // );

  get auth => null;

  // GET UID
  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser!).uid;
  }
}
