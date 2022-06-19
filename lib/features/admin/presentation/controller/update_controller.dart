import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/utils/image_picker.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
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

  final fotoKk = "".obs;
  final fotoKtp = "".obs;
  final fotoBpjs = "".obs;

  final isLoading = true.obs;

  final dataPasien = {}.obs;

  final args = Get.arguments;

  @override
  void onInit() {
    if (args != null) {
      getPasienById(args['id_pasien']);
    }
    super.onInit();
  }

  //gender dropdown attribute
  final List<String> menuItems = [
    'Laki-Laki',
    'Perempuan',
  ].obs;

  var genderValue = "".obs;

  void onSelectGender(String value) {
    genderValue(value);
  }

  String? initGenderValue() {
    if (genderValue.value != "") {
      return menuItems.singleWhere((element) => element == genderValue.value);
    }
    return null;
  }

  //provinsi dropdown attribute
  final List<String> provItems = [
    'Kalimantan Tengah',
    'Yogyakarta',
  ].obs;

  var provValue = "".obs;

  void onSelectProv(String value) {
    provValue(value);
  }

  String? initProvValue() {
    if (provValue.value != "") {
      return provItems.singleWhere((element) => element == provValue.value);
    }
    return null;
  }

  //kabupaten dropdown attribute
  final List<String> kabItems = [
    'Sleman',
    'Bantul',
  ].obs;

  var kabValue = "".obs;

  void onSelectkab(String value) {
    kabValue(value);
  }

  String? initKabValue() {
    if (kabValue.value != "") {
      return kabItems.singleWhere((element) => element == kabValue.value);
    }
    return null;
  }

  void updatePasien() async {
    try {
      await PasienSql.updatePasien(
        dataPasien["id_pasien"],
        dataPasien["status_pasien"],
        namaController.value.text,
        emailController.value.text,
        sandiController.value.text,
        namaKKController.value.text,
        genderValue.value,
        provValue.value,
        kabValue.value,
        kodeposController.value.text,
        detailAlamatController.value.text,
        dataPasien["foto_profile_path"],
        dataPasien["kk_path"],
        dataPasien["ktp_path"],
        dataPasien["bpjs_path"],
      );

      Get.back();
      Get.snackbar("E-Puskesmas", "Data Berhasil Di Ubah");
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }

  void getPasienById(int idPasien) async {
    isLoading(true);
    final pasien = await PasienSql.getSinglePasienById(idPasien);
    dataPasien(pasien.last);

    namaController.value.text = dataPasien["nama_lengkap"];
    emailController.value.text = dataPasien["email"];
    sandiController.value.text = dataPasien["password"];
    namaKKController.value.text = dataPasien["nama_kk"];
    genderValue.value = dataPasien["jenis_kelamin"];
    provValue.value = dataPasien["provinsi"];
    kabValue.value = dataPasien["kabupaten"];
    kodeposController.value.text = dataPasien["kode_Pos"];
    detailAlamatController.value.text = dataPasien["detail_alamat"];

    fotoKk(dataPasien["kk_path"]);
    fotoKtp(dataPasien["ktp_path"]);
    fotoBpjs(dataPasien["bpjs_path"]);

    print(genderValue.value);
    print(provValue.value);
    print(kabValue.value);

    isLoading(false);
  }
}
