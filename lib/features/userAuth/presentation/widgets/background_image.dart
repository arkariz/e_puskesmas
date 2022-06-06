import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/login_image.png",
          width: size.width * 0.75,
        ),
      ),
    );
  }
}
