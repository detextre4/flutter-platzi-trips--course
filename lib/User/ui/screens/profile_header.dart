import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/User/model/user.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/user_info.dart';
import 'package:flutter_platzi_trips/User/ui/widgets/button_bar.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ProfileHeader extends StatelessWidget {
  late UserBloc userbloc;
  late User user;

  @override
  Widget build(BuildContext context) {
    userbloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userbloc.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      // ignore: avoid_print
      print("not logged");
      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Couldn't load the information. Do login")
          ],
        ),
      );
    } else {
      // ignore: avoid_print
      print("logged");
      // ignore: prefer_const_constructors
      final title = Text(
        'Profile',
        style: const TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
