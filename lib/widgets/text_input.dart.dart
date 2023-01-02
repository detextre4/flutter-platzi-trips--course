import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class TextInput extends StatelessWidget {
  final dynamic placeholder;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines;
  TextInput(
      {super.key,
      this.placeholder,
      required this.inputType,
      required this.controller,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          style: const TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFe5e5e5),
            border: InputBorder.none,
            hintText: placeholder,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
          )),
    );
  }
}
