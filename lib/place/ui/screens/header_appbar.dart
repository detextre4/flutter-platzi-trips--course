import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/card_image_list.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:flutter_platzi_trips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class HeaderAppbar extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return SizedBox(
        child: ClipRect(
            child: BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0, tileMode: TileMode.clamp),
      child: StreamBuilder(
          stream: userBloc.authStatus,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return showPlacesData(snapshot);
            }
          }),
    )));
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: [
          GradientBack(height: 250.0),
          const Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(
        children: [
          GradientBack(title: "Bienvenido", height: 250.0),
          CardImageList(user: user),
        ],
      );
    }
  }
}
