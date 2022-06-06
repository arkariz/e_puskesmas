import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:flutter/material.dart';

class LandingText extends StatelessWidget {
  const LandingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          H1Text(
            text: "Selamat Datang",
            bold: true,
          ),
          H2Text(
            text: "Silahkan Login",
            bold: false,
          ),
        ],
      ),
    );
  }
}
