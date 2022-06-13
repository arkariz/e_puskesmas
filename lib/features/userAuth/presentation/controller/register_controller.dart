import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final namaController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final sandiController = TextEditingController().obs;

  final namaKKController = TextEditingController().obs;

  final kodeposController = TextEditingController().obs;
  final detailAlamatController = TextEditingController().obs;

  final namaNode = FocusNode().obs;
  final emailNode = FocusNode().obs;
  final sandiNode = FocusNode().obs;
  final namaKKNode = FocusNode().obs;
  final kodeposNode = FocusNode().obs;
  final detailAlamatNode = FocusNode().obs;

  String statusPasien = Get.arguments;

  final List<String> menuItems = [
    'Laki-Laki',
    'Perempuan',
  ].obs;

  var genderValue = "".obs;

  void onSelectGender(String value) {
    genderValue(value);
  }

  final List<String> provItems = [
    'Kalimantan Tengah',
    'Perempuan',
  ].obs;

  var provValue = "".obs;

  void onSelectProv(String value) {
    genderValue(value);
  }

  final List<String> kabItems = [
    'Sleman',
    'Perempuan',
  ].obs;

  var kabValue = "".obs;

  void onSelectkab(String value) {
    genderValue(value);
  }

  void createPasien() async {
    try {
      await PasienSql.createPasien(
        statusPasien,
        namaController.value.text,
        emailController.value.text,
        sandiController.value.text,
        namaKKController.value.text,
        genderValue.value,
        provValue.value,
        kabValue.value,
        kodeposController.value.text,
        detailAlamatController.value.text,
        "profilePath",
        "kkPath",
        "ktpPath",
        "bpjsPath",
      );

      Get.offNamed(Routes.LOGIN);
      Get.snackbar("E-Puskesmas", "Pendaftaran Berhasil");
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }
}
