import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ButtonGreen extends StatefulWidget {
  final String text;
  double width;
  double height;
  double radius;
  final VoidCallback onPressed;

  ButtonGreen(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = 300.0,
      this.height = 50.0,
      this.radius = 10.0});

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
}

// ignore: unused_element
class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // on tap
      onTap: widget.onPressed,
      // child
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: const LinearGradient(
                colors: [
                  Color(0xffa7ff84),
                  Color(0xff1cbb7b),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
            child: Text(
          widget.text,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        )),
      ),
    );
  }
}
