import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final sandiController = TextEditingController().obs;

  final emailNode = FocusNode().obs;
  final sandiNode = FocusNode().obs;

  void loginPasien() async {
    final pasien = await PasienSql.getSinglePasien(
      emailController.value.text,
      sandiController.value.text,
    );

    print("tes ${pasien.last['nama_lengkap']}");
    Get.offNamed(Routes.HOME, arguments: pasien);
  }
}
