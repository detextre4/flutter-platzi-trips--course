import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class GradientBack extends StatelessWidget {
  // String title = "Popular";
  dynamic title;
  dynamic height;

  GradientBack({super.key, this.height, this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: height ?? screenHeight,
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
      child: FittedBox(
        fit: BoxFit.none,
        alignment: const Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 0.05),
              borderRadius: BorderRadius.circular(screenHeight / 2)),
        ),
      ),
      // child: Text(
      //   title,
      //   style: const TextStyle(
      //       color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      // ),
    );
  }
}
