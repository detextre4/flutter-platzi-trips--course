import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/repository/firebase_auth_api.dart';
import 'package:flutter_platzi_trips/platzi_trips.dart';
import 'package:flutter_platzi_trips/widgets/button_green.dart';
import 'package:flutter_platzi_trips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'dart:developer';

// ignore: use_key_in_widget_constructors
class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

// ignore: unused_element
class _SignInScreen extends State<SignInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // snapshot - data - Object User
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUi();
          } else {
            return PlatziTrips();
          }
        });
  }

  Widget signInGoogleUi() {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", screenHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    userBloc.signIn().then(
                        // ignore: avoid_print
                        (User) =>
                            {inspect(User), print("----> user is $User")});
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
