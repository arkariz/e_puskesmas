import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
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
          H2Text(
            text: "SELAMAT DATANG DI PENDAFTARAN ONLINE PUSKESMAS KEMUMU BENGKULU UTARA",
            bold: true,
            isCenter: true,
          ),
          H3Text(
            text: "Silahkan Login",
            textColor: Colors.teal,
            bold: false,
          ),
        ],
      ),
    );
  }
}
