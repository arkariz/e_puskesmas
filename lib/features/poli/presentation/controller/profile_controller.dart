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
    final String? isLogin = prefs.getString("isLogin");

    if (isLogin! == "pasien login") {
      final List<String>? pasien = prefs.getStringList('pasien');

      idPasien(pasien![0]);
      namaPasien(pasien[1]);
      statusPasien(pasien[2]);
      email(pasien[3]);
      image(pasien[4]);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLogin', "logout");
    Get.offAllNamed(Routes.LOGIN);
  }
  // [x] Revisi Pasien Field

  void updateFoto() async {
    // try {
    await PickImage().getImage(ImageSource.gallery).then((file) async {
      final prefs = await SharedPreferences.getInstance();

      final List<String>? pasienCache = prefs.getStringList('pasien');
      final pasien = await PasienSql.getSinglePasienById(int.parse(pasienCache![0]));

      await PasienSql.updatePasien(
        pasien.last["id_pasien"],
        pasien.last['status_pasien'],
        pasien.last['email'],
        pasien.last['password'],
        pasien.last['no_rekam_medis'],
        pasien.last['no_bpjs'],
        pasien.last['nama_lengkap'],
        pasien.last['nama_kk'],
        pasien.last['tanggal_lahir'],
        pasien.last['tempat_lahir'],
        pasien.last['usia'],
        pasien.last['jenis_kelamin'],
        pasien.last['detail_alamat'],
        pasien.last['kk_path'],
        pasien.last['ktp_path'],
        pasien.last['bpjs_path'],
        file.path,
      );

      await prefs.setStringList('pasien', <String>[
        pasien.last["id_pasien"].toString(),
        pasien.last["nama_lengkap"],
        pasien.last["status_pasien"],
        pasien.last["email"],
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

      final List<String>? pasienCache = prefs.getStringList('pasien');
      final pasien = await PasienSql.getSinglePasienById(int.parse(pasienCache![0]));

      await PasienSql.updatePasien(
        pasien.last["id_pasien"],
        pasien.last['status_pasien'],
        emailTextController.value.text,
        pasien.last['password'],
        pasien.last['no_rekam_medis'],
        pasien.last['no_bpjs'],
        namaTextController.value.text,
        pasien.last['nama_kk'],
        pasien.last['tanggal_lahir'],
        pasien.last['tempat_lahir'],
        pasien.last['usia'],
        pasien.last['jenis_kelamin'],
        pasien.last['detail_alamat'],
        pasien.last['kk_path'],
        pasien.last['ktp_path'],
        pasien.last['bpjs_path'],
        pasien.last['foto_profile_path'],
      );

      await prefs.setStringList('pasien', <String>[
        pasien.last["id_pasien"].toString(),
        namaTextController.value.text,
        pasien.last["status_pasien"],
        emailTextController.value.text,
        pasien.last["foto_profile_path"],
      ]);

      getPasien();
      homeController.getPasien();
      Get.back();
    } catch (e) {
      Get.snackbar("Profile", "Terjadi Kesalahan");
    }
  }
}
