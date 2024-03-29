import 'package:flutter/material.dart';

class H2Text extends StatelessWidget {
  const H2Text({
    Key? key,
    required this.text,
    required this.bold,
    this.isCenter,
    this.textColor,
  }) : super(key: key);

  final String text;
  final bool bold;
  final bool? isCenter;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter != null ? TextAlign.center : null,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: "poppins",
        fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
