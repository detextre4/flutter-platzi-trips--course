import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi_trips/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/widgets/custome_button.dart';
import 'package:flutter_platzi_trips/widgets/gradient_back.dart';
import 'package:flutter_platzi_trips/widgets/text_input.dart.dart';
import 'package:flutter_platzi_trips/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocationPlace = TextEditingController();
  XFile image;
  AddPlaceScreen({super.key, required this.image});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    alignment: Alignment.center,
                    child: CardImage(
                      imageType: false,
                      width: 350,
                      left: 0,
                      pathImage: widget.image.path,
                      iconData: Icons.camera_alt,
                      onPressedFavicon: () {},
                    ),
                  ),
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
                      controller: widget._controllerLocationPlace,
                      icondata: Icons.location_on),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: CustomeButton(
                          buttonText: "Add Place",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // 1. firebase Storage
                              userBloc
                                  .updatePlaceData(Place(
                                      name: widget._controllerTitlePlace.text,
                                      description: widget
                                          ._controllerDescriptionPlace.text,
                                      likes: 0))
                                  .whenComplete(
                                      // ignore: avoid_print
                                      () => {Navigator.pop(context)});
                              // url
                              // 2. Cloud Firestore
                              // 3. Place - title, destruction, url, userOwner, likes
                            }
                          }))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
