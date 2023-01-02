import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class TextInputLocation extends StatelessWidget {
  final dynamic placeholder;
  final TextEditingController controller;
  final IconData icondata;
  const TextInputLocation(
      {super.key,
      this.placeholder,
      required this.controller,
      required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 7.0))
        ]),
        child: TextField(
          controller: controller,
          style: const TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: placeholder,
            suffixIcon: Icon(icondata),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffffffff)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffffffff)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
          ),
        ));
  }
}
