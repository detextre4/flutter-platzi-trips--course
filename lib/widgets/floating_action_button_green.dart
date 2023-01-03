import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  const FloatingActionButtonGreen(
      {super.key, required this.iconData, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool _buttonPressed = false;
  IconData favIcon = Icons.favorite_border;

  void onPressedFav() {
    setState(() {
      _buttonPressed = !_buttonPressed;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: SizedBox(
        child: Text(
            _buttonPressed ? 'added to favorites' : 'removed from favorites'),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: null,
        backgroundColor: const Color(0xff11da53),
        mini: true,
        tooltip: "Fav",
        onPressed: widget.onPressed,
        child: Icon(
          _buttonPressed ? Icons.favorite : Icons.favorite_border,
        ));
  }
}
