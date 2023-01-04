import 'package:flutter/material.dart';
// import 'package:flutter_platzi_trips/User/model/user.dart';

class Place {
  late dynamic id;
  String name;
  String description;
  String urlImage;
  int likes;
  bool liked;
  // User? userOwner;

  Place({
    Key? key,
    required this.name,
    required this.description,
    this.urlImage = "",
    this.likes = 0,
    this.liked = false,
    this.id,
    // this.userOwner
  });
}
