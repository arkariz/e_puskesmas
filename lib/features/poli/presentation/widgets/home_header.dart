import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          const SizedBox(width: kLabelPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              H5Text(text: "Firman", bold: false),
              H5Text(text: "Pasien Umum", bold: false),
            ],
          )
        ],
      ),
    );
  }
}
