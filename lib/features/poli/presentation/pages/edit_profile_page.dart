import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<ProfileController> {
  EditProfilePage({Key? key}) : super(key: key);

  final namaNode = FocusNode();
  final emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: kDefaultPadding * 2),
            CustomTextField(
              controller: controller.namaTextController.value,
              node: namaNode,
              size: size,
              label: "Nama Lengkap",
              hint: "Masukkan Nama Lengkap",
            ),
            CustomTextField(
              controller: controller.emailTextController.value,
              node: emailNode,
              size: size,
              label: "Email",
              hint: "Masukkan Email",
            ),
            CustomButton(
                size: size,
                label: "Simpan",
                onPressed: () {
                  controller.updateDataPasien();
                })
          ],
        ),
      ),
    );
  }
}
