import 'dart:io';

import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(
        () => Row(
          children: [
            if (controller.image.value == "profilePath" || controller.image.value == "")
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/user.png"),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.file(
                  File(controller.image.value),
                  height: 79,
                  width: 79,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: kLabelPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H5Text(text: controller.namaPasien.value, bold: false),
                H5Text(text: controller.namaPasien.value, bold: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}
