import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/utils/image_picker.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  final image = "".obs;

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

      print(pasien!.length);
      idPasien(pasien[0]);
      namaPasien(pasien[1]);
      statusPasien(pasien[2]);
      email(pasien[3]);
      image(pasien[4]);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    Get.offNamed(Routes.LOGIN);
  }

  void updateFoto() async {
    // try {
    await PickImage().getImage(ImageSource.gallery).then((file) async {
      final prefs = await SharedPreferences.getInstance();

      final List<String>? pasien = prefs.getStringList('data_pasien');
      await PasienSql.updatePasien(
        int.parse(pasien![0]),
        pasien[1],
        pasien[2],
        pasien[3],
        pasien[4],
        pasien[5],
        pasien[6],
        pasien[7],
        pasien[8],
        pasien[9],
        pasien[10],
        file.path,
        pasien[12],
        pasien[13],
        pasien[14],
      );

      await prefs.setStringList('pasien', <String>[
        pasien[0],
        pasien[2],
        pasien[1],
        pasien[3],
        file.path,
      ]);
    });

    getPasien();
    homeController.getPasien();
    // } catch (e) {
    //   print(e.toString());
    //   Get.snackbar("Profile", "Terjadi Kesalahan");
    // }
  }

  void updateDataPasien() async {
    try {
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
        pasien[11],
      ]);

      namaPasien(namaTextController.value.text);
      email(emailTextController.value.text);

      homeController.getPasien();
      Get.back();
    } catch (e) {
      Get.snackbar("Profile", "Terjadi Kesalahan");
    }
  }
}
