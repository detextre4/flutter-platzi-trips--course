import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/ui/screens/profile_header.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_places_list.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_background.dart';

// ignore: use_key_in_widget_constructors
class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );
  }
}
