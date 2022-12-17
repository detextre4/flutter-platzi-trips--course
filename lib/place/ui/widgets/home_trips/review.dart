import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Review extends StatelessWidget {
  String imgPath;
  String name;
  String details;
  String comment;

  Review(this.imgPath, this.name, this.details, this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    final userName = Container(
      alignment: const Alignment(-1, 0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 17.0),
      ),
    );

    final userInfo = Container(
      alignment: const Alignment(-1, 0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 13.0, color: Color(0xa3a5a3a7)),
      ),
    );

    final userComment = Container(
      alignment: const Alignment(-1, 0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
      ),
    );

    final userDetails = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [userName, userInfo, userComment]),
    );

    final photo = Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imgPath))),
    );

    return Row(
      children: [
        photo,
        userDetails,
      ],
    );
  }
}
