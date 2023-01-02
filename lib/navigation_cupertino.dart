import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platzi_trips/Place/ui/screens/home_trips.dart';
import 'package:flutter_platzi_trips/Place/ui/screens/search_trips.dart';
import 'package:flutter_platzi_trips/User/ui/screens/profile_trips.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors
class BottomNavigationCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.purple,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(Icons.home)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(Icons.search)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(Icons.person)),
                  label: ""),
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                      bloc: UserBloc(), child: ProfileTrips());
                },
              );
            default:
              return const SizedBox();
          }
        });
  }
}
