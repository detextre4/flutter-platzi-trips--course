import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';

class CloudFirestoreApi {
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(User user) async {
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
