import 'package:flutter/material.dart';

class H3Text extends StatelessWidget {
  const H3Text({
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
        fontSize: 16.0,
        fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        color: Colors.black,
      ),
    );
  }
}
