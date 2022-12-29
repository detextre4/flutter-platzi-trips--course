// import 'dart:async';

import 'package:flutter_platzi_trips/User/repository/auth_repository.dart';
import 'package:flutter_platzi_trips/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: library_prefixes
import 'package:flutter_platzi_trips/User/model/user.dart' as userModel;

class UserBloc implements Bloc {
  // Flujo de datos Streams
  // Stream - Firebase
  // ScreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  // casos uso

  // 1. sigIn to the google app
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  // 2. register user in database
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(userModel.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
