import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    this.buttonWidth,
    required this.label,
    this.textColor,
    required this.onPressed, this.buttonColor,
  }) : super(key: key);

  final Size size;
  final double? buttonWidth;
  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth == null ? size.width * 0.85 : size.width * buttonWidth!,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonColor != null ? ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(buttonColor!)) : null,
        child: H2Text(
          text: label,
          bold: false,
          textColor: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
