// import 'dart:async';
import 'package:flutter_platzi_trips/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  // casos uso
  // 1. sigIn to the google app
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {}
}
