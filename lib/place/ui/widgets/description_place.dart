import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/Place/model/place.dart';
import 'package:flutter_platzi_trips/User/bloc/bloc_user.dart';
import 'package:flutter_platzi_trips/widgets/custome_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DescriptionPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    // Title
    Widget title(String name) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Text(name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                )),
          ),
          Row(
            children: [
              Star(const Color(0xFFf2c611), const Icon(Icons.star)),
              Star(const Color(0xFFf2c611), const Icon(Icons.star)),
              Star(const Color(0xFFf2c611), const Icon(Icons.star)),
              Star(const Color(0xFFf2c611), const Icon(Icons.star_half)),
              Star(const Color.fromARGB(255, 242, 198, 222),
                  const Icon(Icons.star_border))
            ],
          ),
        ],
      );
    }

    // content
    Widget content(Place place) {
      return FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    place.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomeButton(
                    buttonText: "Navigate",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Yay! A SnackBar!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ));
                    },
                  ),
                )
              ],
            ),
          ));
    }

    // laoyut
    Widget reviewLayout(Place place) {
      return Container(
          margin: const EdgeInsets.only(top: 360),
          child: Column(
            children: [title(place.name), content(place)],
          ));
    }

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Place place = snapshot.data;
            return reviewLayout(place);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 400.0, left: 20.0, right: 20.0),
                  child: const Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });
  }
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class Star extends StatelessWidget {
  Color color = const Color.fromARGB(255, 242, 198, 222);
  Icon icon = const Icon(Icons.star_border);

  Star(this.color, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 30.0, maxHeight: 30.0),
      child: IconButton(
        splashRadius: 18,
        padding: const EdgeInsets.all(0),
        icon: icon,
        color: color,
        onPressed: () {},
      ),
      // child: Icon(
      //   icon,
      //   color: color,
      // ),
    );
  }
}
