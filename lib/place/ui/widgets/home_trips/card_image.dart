import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/home_trips/floating_action_button_green.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CardImage extends StatelessWidget {
  String pathImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png";

  CardImage(this.pathImage, {super.key});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: const EdgeInsets.only(
        top: 80.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(pathImage)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [card, FloatingActionButtonGreen()],
    );
  }
}
