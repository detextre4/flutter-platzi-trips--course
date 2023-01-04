import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:flutter_platzi_trips/User/ui/screens/profile_header.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_places_list.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/profile_background.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ProfileTrips extends StatelessWidget {
  late UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return ShowProfileData(snapshot);
          }
        });
  }

  // ignore: non_constant_identifier_names
  Widget ShowProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      // ignore: avoid_print
      print("not logeed");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: const <Widget>[Text("user not logged, pls login")],
          ),
        ],
      );
    } else {
      // ignore: avoid_print
      print("are logged");
      var user = User(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          uid: snapshot.data.uid);
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),
              ProfilePlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }
}
