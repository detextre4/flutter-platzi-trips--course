import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_platzi_trips/widgets/gradient_back.dart';
import 'package:flutter_platzi_trips/widgets/text_input.dart.dart';
import 'package:flutter_platzi_trips/widgets/title_header.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocaitonPlace = TextEditingController();
  dynamic image;
  AddPlaceScreen({super.key, this.image});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
            height: 300.0,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    )),
                Flexible(
                    child: Container(
                  padding: const EdgeInsets.only(top: 12.0, left: 20.0),
                  child: const TitleHeader(title: 'Add a new Place'),
                )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    placeholder: "Title",
                    controller: widget._controllerTitlePlace,
                    inputType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    placeholder: "Description",
                    inputType: TextInputType.multiline,
                    controller: widget._controllerDescriptionPlace,
                    maxLines: 4,
                  ),
                ),
                TextInputLocation(
                    placeholder: "Add Location",
                    controller: widget._controllerLocaitonPlace,
                    icondata: Icons.location_on)
              ],
            ),
          )
        ],
      ),
    );
  }
}
