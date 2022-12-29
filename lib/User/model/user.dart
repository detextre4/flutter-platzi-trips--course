import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  User(
      {Key? key,
      required this.name,
      required this.email,
      required this.photoURL,
      required this.uid,
      this.myPlaces = const [],
      this.myFavoritePlaces = const []});
}
