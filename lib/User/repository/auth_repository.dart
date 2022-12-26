import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository {
  // ignore: non_constant_identifier_names
  final _FirebaseAuthApi = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() =>
      _FirebaseAuthApi.signInWithGoogle();
}
