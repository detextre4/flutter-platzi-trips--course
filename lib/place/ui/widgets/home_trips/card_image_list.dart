import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/home_trips/card_image.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage(
              "https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg"),
          CardImage(
              "https://images.unsplash.com/photo-1613698808499-f772ccb4f527?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80"),
          CardImage(
              "https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
          CardImage(
              "https://img.freepik.com/free-vector/beach-background_23-2148161937.jpg?fit=crop&w=240&h=130?auto=format&fit=crop&w=480&h=260"),
          CardImage("https://www.w3schools.com/css/img_lights.jpg"),
        ],
      ),
    );
  }
}
