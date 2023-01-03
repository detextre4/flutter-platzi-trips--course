import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreApi.updateUserData(user);
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreApi.updatePlaceData(place);
}
