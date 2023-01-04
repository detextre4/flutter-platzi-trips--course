import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CardImageList extends StatefulWidget {
  late UserBloc userBloc;
  User user;
  CardImageList({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _cardImageList();
  }
}

// ignore: camel_case_types
class _cardImageList extends State<CardImageList> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return SizedBox(
      height: 350.0,
      child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return ListViewPlaces(
                    userBloc.buildPlaces(snapshot.data.docs, widget.user));
            }
          }),
    );
  }

  // Widget ListViewPlaces(List<CardImage> placesCard) {
  // ignore: non_constant_identifier_names
  Widget ListViewPlaces(List<Place> places) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes + 1 : place.likes - 1;
        userBloc.placeSelectedSink.add(place);
      });
    }

    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            userBloc.placeSelectedSink.add(place);
          },
          child: CardImage(
            pathImage: place.urlImage,
            width: 300.0,
            height: 250.0,
            left: 20.0,
            iconData: place.liked ? Icons.favorite : Icons.favorite_border,
            onPressedFavicon: () {
              setLiked(place);
            },
          ),
        );
      }).toList(),
    );
  }
}
