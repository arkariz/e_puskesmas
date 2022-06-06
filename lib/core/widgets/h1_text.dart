import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  const H1Text({
    Key? key,
    required this.text,
    required this.bold, this.textColor,
  }) : super(key: key);

  final String text;
  final bool bold;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 26.0,
        fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
