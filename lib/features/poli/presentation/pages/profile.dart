import 'dart:io';

import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    if (controller.image.value == "" || controller.image.value == "profilePath")
                      const CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      )
                    else
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.file(
                          File(controller.image.value),
                          height: 130,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const Positioned(
                      left: 84,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 22,
                      ),
                    ),
                    Positioned(
                      left: 90,
                      child: GestureDetector(
                        onTap: controller.updateFoto,
                        child: const Icon(
                          Icons.edit,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                H4Text(
                  text: controller.statusPasien.value,
                  bold: true,
                  textColor: Colors.teal,
                ),
                const SizedBox(height: kLabelPadding),
                H1Text(text: controller.namaPasien.value, bold: true),
                H3Text(text: controller.email.value, bold: false),
                const SizedBox(height: kTopPadding * 2),
                CustomButton(
                  size: size,
                  label: "Edit Profile",
                  onPressed: () {
                    Get.toNamed(Routes.EDIT_PROFIL);
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                CustomButton(
                  size: size,
                  label: "Keluar",
                  onPressed: controller.logout,
                ),
                const SizedBox(height: kDefaultPadding * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
