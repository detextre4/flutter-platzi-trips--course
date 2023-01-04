import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
// ignore: library_prefixes
import 'package:flutter_platzi_trips/User/model/user.dart' as ModelUser;

class CloudFirestoreApi {
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(ModelUser.User user) async {
    // ignore: unused_local_variable
    DocumentReference ref = _db.collection(USERS).doc(user.uid);

    return ref.set({
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoURL": user.photoURL,
      "myPlaces": user.myPlaces,
      "myFavoritePlaces": user.myFavoritePlaces,
      "lastsignIn": DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    User? user = _auth.currentUser;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("$USERS/${user?.uid}"), // reference..
      'urlImage': place.urlImage,
    }).then((dr) {
      dr.get().then((snapshot) {
        snapshot.id; // ID Places
        DocumentReference refUsers = _db.collection(USERS).doc(user?.uid);
        refUsers.update({
          'myPlacces':
              FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
        });
      });
    });
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_platzi_trips/User/model/user.dart';

// class CloudFirestoreAPI {
//   // ignore: non_constant_identifier_names
//   final String USERS = 'users';
//   // ignore: non_constant_identifier_names
//   final String PLACE = 'places';

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> updateUserData(User user) async {
//     CollectionReference users = _firestore.collection(USERS);
//     // ignore: unused_local_variable
//     DocumentReference ref = users.doc(user.uid);
//   }
// }
