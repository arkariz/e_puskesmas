import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final HomeController homeController = Get.find();

  final namaTextController = TextEditingController().obs;
  final emailTextController = TextEditingController().obs;
  final alamatTextController = TextEditingController().obs;

  final idPasien = "".obs;
  final namaPasien = "".obs;
  final statusPasien = "".obs;
  final email = "".obs;

  @override
  void onInit() {
    getPasien();
    super.onInit();
  }

  void getPasien() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isLogin = prefs.getBool("isLogin");

    if (isLogin!) {
      final List<String>? pasien = prefs.getStringList('pasien');

      idPasien(pasien![0]);
      namaPasien(pasien[1]);
      statusPasien(pasien[2]);
      email(pasien[3]);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    Get.offNamed(Routes.LOGIN);
  }

  void updateDataPasien() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? pasien = prefs.getStringList('data_pasien');
    await PasienSql.updatePasien(
      int.parse(pasien![0]),
      pasien[1],
      namaTextController.value.text,
      emailTextController.value.text,
      pasien[4],
      pasien[5],
      pasien[6],
      pasien[7],
      pasien[8],
      pasien[9],
      pasien[10],
      pasien[11],
      pasien[12],
      pasien[13],
      pasien[14],
    );

    await prefs.setStringList('pasien', <String>[
      pasien[0],
      namaTextController.value.text,
      pasien[1],
      emailTextController.value.text,
    ]);

    namaPasien(namaTextController.value.text);
    email(emailTextController.value.text);

    homeController.getPasien();
    Get.back();
  }
}
