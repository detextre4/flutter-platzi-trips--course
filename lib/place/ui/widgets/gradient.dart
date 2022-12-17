import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class GradientBack extends StatelessWidget {
  String title = "Popular";
  GradientBack(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff4266d3),
                Color(0xff564cd1),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      alignment: const Alignment(-0.9, -0.6),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
