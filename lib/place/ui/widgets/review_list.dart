import 'package:flutter/material.dart';
import 'review.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    return Container(
      alignment: Alignment.center,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Review("assets/images/avatar.png", "Varuna Yasas", "1 review 5 photos",
            "There is an amazing place in Sri Lanka"),
        Review("assets/images/avatar.png", "Varuna Yasas", "1 review 5 photos",
            "There is an amazing place in Sri Lanka"),
        Review("assets/images/avatar.png", "Varuna Yasas", "1 review 5 photos",
            "There is an amazing place in Sri Lanka")
      ]),
    );
  }
}
