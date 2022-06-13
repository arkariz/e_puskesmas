import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final sandiController = TextEditingController().obs;

  final emailNode = FocusNode().obs;
  final sandiNode = FocusNode().obs;

  void loginPasien() async {
    try {
      final pasien = await PasienSql.getSinglePasien(
        emailController.value.text,
        sandiController.value.text,
      );

      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('pasien', <String>[
        pasien.last['nama_lengkap'],
        pasien.last['status_pasien'],
        pasien.last['email'],
      ]);

      await prefs.setBool('isLogin', true);

      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }
}
