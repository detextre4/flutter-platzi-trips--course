import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/platzi_trips.dart';
import 'package:flutter_platzi_trips/widgets/button_green.dart';
import 'package:flutter_platzi_trips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
// ignore: library_prefixes
import 'package:flutter_platzi_trips/User/model/user.dart' as ModelUser;

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
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;

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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                    width: screenWidth,
                    child: const Text(
                      "Welcome \n This is your Travel App",
                      style: TextStyle(
                          fontSize: 33.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn().then((UserCredential user) {
                      userBloc.updateUserData(ModelUser.User(
                          name: user.user?.displayName ?? '',
                          email: user.user?.email ?? '',
                          photoURL: user.user?.photoURL ?? '',
                          uid: user.user?.uid ?? ''));
                    });
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
