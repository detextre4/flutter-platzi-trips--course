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

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreApi.buildPlaces(placesListSnapshot);
}
