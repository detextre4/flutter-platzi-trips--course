import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/widgets/floating_action_button_green.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CardImage extends StatelessWidget {
  final double width;
  final double height;
  double left;
  final String pathImage;
  final VoidCallback onPressedFavicon;
  final IconData iconData;

  CardImage({
    super.key,
    required this.pathImage,
    this.left = 20.0,
    this.width = 300,
    this.height = 250,
    required this.onPressedFavicon,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left,
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
      children: [
        card,
        FloatingActionButtonGreen(
          iconData: Icons.accessibility_new_rounded,
          onPressed: () {},
        )
      ],
    );
  }
}
