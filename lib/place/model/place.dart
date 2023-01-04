import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';

class Place {
  late String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.urlImage = "",
      this.likes = 0,
      this.userOwner});
}
