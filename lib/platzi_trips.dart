// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/navigation_cupertino.dart';
// import 'package:flutter_platzi_trips/pages/home/body/home_trips.dart';
// import 'package:flutter_platzi_trips/pages/persons/profile_trips.dart';
// import 'package:flutter_platzi_trips/pages/search/search_trips.dart';

// ignore: use_key_in_widget_constructors
class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTab = 0;

  void onTabTapped(int index) {
    setState(() {
      indexTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationCupertino(),
      // body: IndexedStack(
      //   index: indexTab,
      //   children: [HomeTrips(), SearchTrips(), ProfileTrips()],
      // ),
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(canvasColor: Colors.white),
      //   child: BottomNavigationBar(
      //     onTap: onTabTapped,
      //     currentIndex: indexTab,
      //     selectedItemColor: Colors.purple,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Container(
      //               margin: const EdgeInsets.only(top: 20),
      //               child: const Icon(Icons.home)),
      //           label: "",
      //           tooltip: "home"),
      //       BottomNavigationBarItem(
      //           icon: Container(
      //               margin: const EdgeInsets.only(top: 20),
      //               child: const Icon(Icons.search)),
      //           label: "",
      //           tooltip: "search"),
      //       BottomNavigationBarItem(
      //           icon: Container(
      //               margin: const EdgeInsets.only(top: 20),
      //               child: const Icon(Icons.person)),
      //           label: "",
      //           tooltip: "person"),
      //     ],
      //   ),
      // )
    );
  }
}
