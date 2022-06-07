import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    Key? key,
    required this.jenisPasien,
  }) : super(key: key);

  final String jenisPasien;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2 * kTopPadding),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        Padding(
          padding: const EdgeInsets.all(kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const H1Text(text: "Daftar Sebagai", bold: true),
              H1Text(text: jenisPasien, bold: true),
            ],
          ),
        ),
      ],
    );
  }
}
