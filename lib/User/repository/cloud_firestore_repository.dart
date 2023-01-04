import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_place.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreApi.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreApi.updatePlaceData(place);

  Stream<QuerySnapshot> placeListStream() =>
      _cloudFirestoreApi.placeListStream();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreApi.buildMyPlaces(placesListSnapshot);

  List<Place> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot, User user) =>
      _cloudFirestoreApi.buildPlaces(placesListSnapshot, user);

  Stream<QuerySnapshot> placesCollectionByUserIdFirestore(String uid) =>
      _cloudFirestoreApi.placesCollectionByUserId(uid);

  Future likePlace(Place place, String idPlace) =>
      _cloudFirestoreApi.likePlace(place, idPlace);
}
