import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ProfilePlacesList extends StatelessWidget {
  late UserBloc userBloc;
  User user;
  ProfilePlacesList({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc.myPlacesListStream(user.uid),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data!.docs),
                );
            }
          }),
    );
  }
}
