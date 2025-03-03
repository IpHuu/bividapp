// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonToggle extends StatefulWidget {
  ButtonToggle(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.state})
      : super(key: key);

  late bool state;
  final String title;
  final void Function(bool value)? onPressed;

  @override
  State<ButtonToggle> createState() => _ButtonToggleState();
}

class _ButtonToggleState extends State<ButtonToggle> {
  @override
  Widget build(BuildContext context) {
    final hasCommand = widget.onPressed != null;

    return ElevatedButton(
        onPressed: hasCommand ? _onClick : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                widget.state ? Theme.of(context).primaryColor : Colors.white70),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white60)))),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 10,
            color: widget.state ? Colors.white : Theme.of(context).primaryColor,
          ),
        ));
  }

  void _onClick() {
    setState(() {
      widget.state = !widget.state;
      if (widget.onPressed == null) return;
      widget.onPressed!(widget.state);
    });
  }
}
