// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/description_place.dart';
import 'package:flutter_platzi_trips/Place/ui/screens/header_appbar.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/review_list.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class HomeTrips extends StatelessWidget {
  String descriptionDummy =
      "lorem ip sum de mi asdmasd lorem ipsum de mi sum lorem ip sum de mi asdmasd lorem ipsum de mi sum lorem ip sum de mi asdmasd lorem ipsum de mi sum";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Bahamas", 4, descriptionDummy),
            ReviewList(),
          ],
        ),
        HeaderAppbar(),
      ],
    );
  }
}
