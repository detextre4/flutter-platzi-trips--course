import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/place/ui/widgets/home_trips/card_image_list.dart';
import 'package:flutter_platzi_trips/place/ui/widgets/home_trips/gradient.dart';

// ignore: use_key_in_widget_constructors
class HeaderAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ClipRect(
            child: BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0, tileMode: TileMode.clamp),
      child: Stack(
        children: [
          GradientBack("Bienvenido"),
          CardImageList(),
        ],
      ),
    )));
  }
}
