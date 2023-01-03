import 'package:flutter/material.dart';
import 'package:flutter_platzi_trips/widgets/custome_button.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // Title
    final title = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Text(namePlace,
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

    // content
    final content = FractionallySizedBox(
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
                  descriptionPlace,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  descriptionPlace,
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

    // laoyut
    final reviewLayout = Container(
        margin: const EdgeInsets.only(top: 360),
        child: Column(
          children: [title, content],
        ));
    return reviewLayout;
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
