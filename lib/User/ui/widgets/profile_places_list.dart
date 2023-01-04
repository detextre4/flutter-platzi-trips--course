import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ProfilePlacesList extends StatelessWidget {
  late UserBloc userBloc;

  Place place = Place(
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage:
        'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg',
    likes: 2,
  );
  Place place2 = Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage:
        'https://images.unsplash.com/photo-1613698808499-f772ccb4f527?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80',
    likes: 3,
  );

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.docs),
                );
            }
          }),
    );
  }
}
