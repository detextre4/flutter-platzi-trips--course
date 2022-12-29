import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleButton extends StatefulWidget {
  bool mini;
  // ignore: prefer_typing_uninitialized_variables
  var icon;
  double iconSize;
  // ignore: prefer_typing_uninitialized_variables
  var color;
  final VoidCallback onPressed;

  // ignore: use_key_in_widget_constructors
  CircleButton(
    this.mini,
    this.icon,
    this.iconSize,
    this.color,
    this.onPressed,
  );

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: const Color(0xFF4268D3),
      ),
    ));
  }
}
