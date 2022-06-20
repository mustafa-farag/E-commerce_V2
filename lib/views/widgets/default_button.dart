import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;

  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Theme.of(context).primaryColor,
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
