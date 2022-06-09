import 'package:flutter/material.dart';

class H5Text extends StatelessWidget {
  const H5Text({
    Key? key,
    required this.text,
    required this.bold,
  }) : super(key: key);

  final String text;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontFamily: "poppins",
        fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        color: Colors.black,
      ),
    );
  }
}
