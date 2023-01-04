// import 'dart:async';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi_trips/User/repository/auth_repository.dart';
import 'package:flutter_platzi_trips/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: library_prefixes
import 'package:flutter_platzi_trips/User/model/user.dart' as userModel;
import 'package:firebase_storage/firebase_storage.dart';

class UserBloc implements Bloc {
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebaseStorageRepository = FirebaseStorageRepository();
  // Flujo de datos Streams
  // Stream - Firebase
  // ScreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> currentUser() async => FirebaseAuth.instance.currentUser;

  // casos uso
  // 1. sigIn to the google app
  Future<UserCredential> signIn() => _auth_repository.signInFirebase();

  // 2. register user in database
  void updateUserData(userModel.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Stream placeListStream() => _cloudFirestoreRepository.placeListStream();
  Stream get placesStream => placeListStream();
  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      _cloudFirestoreRepository.placesCollectionByUserIdFirestore(uid);
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
