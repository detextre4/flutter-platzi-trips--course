import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CardImageList extends StatelessWidget {
  late UserBloc userbloc;

  @override
  Widget build(BuildContext context) {
    userbloc = BlocProvider.of<UserBloc>(context);

    return SizedBox(
      height: 350.0,
      child: StreamBuilder(
          stream: userbloc.placesStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return ListViewPlaces(userbloc.buildPlaces(snapshot.data.docs));
            }
          }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListViewPlaces(List<CardImage> placesCard) {
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
