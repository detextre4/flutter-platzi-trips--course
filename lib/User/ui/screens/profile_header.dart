import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/user_info.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/button_bar.dart';

// ignore: use_key_in_widget_constructors
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final title = Text(
      'Profile',
      style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[title],
          ),
          UserInfo('assets/img/ann.jpg', 'Anahí Salgado', 'anahi@platzi.com'),
          ButtonsBar()
        ],
      ),
    );
  }
}