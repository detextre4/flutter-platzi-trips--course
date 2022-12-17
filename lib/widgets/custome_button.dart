import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CustomeButton extends StatelessWidget {
  String buttonText = "Navigate";

  CustomeButton(this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // on tap
      onTap: (() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ));
      }),
      // child
      child: Container(
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [
                  Color(0xff4268d3),
                  Color(0xff584cd1),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        )),
      ),
    );
  }
}
