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

  @override
  void onInit() {
    checkIfLoggedIn();
    super.onInit();
  }

  void loginPasien() async {
    try {
      if (emailController.value.text == "" || sandiController.value.text == "") {
        throw Exception("Email dan Password Harus diisi");
      }
      final pasien = await PasienSql.getSinglePasien(
        emailController.value.text,
        sandiController.value.text,
      );

      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('pasien', <String>[
        pasien.last['id_pasien'].toString(),
        pasien.last['nama_lengkap'],
        pasien.last['status_pasien'],
        pasien.last['email'],
      ]);

      await prefs.setBool('isLogin', true);

      //set pasien data cache
      await prefs.setStringList('data_pasien', <String>[
        pasien.last['id_pasien'].toString(),
        pasien.last['status_pasien'],
        pasien.last['nama_lengkap'],
        pasien.last['email'],
        pasien.last['password'],
        pasien.last['nama_kk'],
        pasien.last['jenis_kelamin'],
        pasien.last['provinsi'],
        pasien.last['kabupaten'],
        pasien.last['kode_Pos'],
        pasien.last['detail_alamat'],
        pasien.last['foto_profile_path'],
        pasien.last['kk_path'],
        pasien.last['ktp_path'],
        pasien.last['bpjs_path'],
      ]);

      Get.offNamed(Routes.NAV_BOTTOM);
    } catch (e) {
      Get.snackbar("E-Puskesmas", e.toString());
    }
  }

  void checkIfLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isLogin = prefs.getBool("isLogin");

    if (isLogin == null) {
      await prefs.setBool('isLogin', false);
    } else {
      if (isLogin) {
        Get.offNamed(Routes.NAV_BOTTOM);
      }
    }
  }
}
