import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.namaLengkap,
    required this.jenisPasien,
  }) : super(key: key);

  final String namaLengkap;
  final String jenisPasien;

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
            children: [
              H5Text(text: namaLengkap, bold: false),
              H5Text(text: jenisPasien, bold: false),
            ],
          )
        ],
      ),
    );
  }
}
