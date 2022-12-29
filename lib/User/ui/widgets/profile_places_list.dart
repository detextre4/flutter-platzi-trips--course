import 'package:flutter/material.dart';
import 'profile_place.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';

// ignore: must_be_immutable
class ProfilePlacesList extends StatelessWidget {
  Place place = Place(
      name: 'Knuckles Mountains Range',
      description: 'Hiking. Water fall hunting. Natural bath',
      urlImage: 'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg',
      likes: 2,
      userOwner: null);
  Place place2 = Place(
      name: 'Mountains',
      description: 'Hiking. Water fall hunting. Natural bath',
      urlImage: 'https://images.unsplash.com/photo-1613698808499-f772ccb4f527?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80',
      likes: 3,
      userOwner: null);

  ProfilePlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
