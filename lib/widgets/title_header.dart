import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class TitleHeader extends StatelessWidget {
  final String title;
  const TitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 30.0),
      ),
    );
  }
}
