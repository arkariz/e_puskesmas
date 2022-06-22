import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  final namaController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final sandiController = TextEditingController().obs;
  final noRekamMedisController = TextEditingController().obs;
  final noBpjsController = TextEditingController().obs;

  final namaKKController = TextEditingController().obs;
  final tanggalLahirController = TextEditingController().obs;
  final tempatLahirController = TextEditingController().obs;
  final usiaController = TextEditingController().obs;

  final detailAlamatController = TextEditingController().obs;

  final namaNode = FocusNode().obs;
  final emailNode = FocusNode().obs;
  final sandiNode = FocusNode().obs;
  final noRekamMedisNode = FocusNode().obs;
  final noBpjsNode = FocusNode().obs;

  final namaKKNode = FocusNode().obs;
  final tanggalLahirNode = FocusNode().obs;
  final tempatLahirNode = FocusNode().obs;
  final usiaNode = FocusNode().obs;

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

  //[x] Update selected pasien
  void updatePasien() async {
    try {
      await PasienSql.updatePasien(
        dataPasien["id_pasien"],
        dataPasien["status_pasien"],
        emailController.value.text,
        sandiController.value.text,
        noRekamMedisController.value.text,
        noBpjsController.value.text,
        namaController.value.text,
        namaKKController.value.text,
        tanggalLahirController.value.text,
        tempatLahirController.value.text,
        usiaController.value.text,
        genderValue.value,
        detailAlamatController.value.text,
        dataPasien["kk_path"],
        dataPasien["ktp_path"],
        dataPasien["bpjs_path"],
        dataPasien["foto_profile_path"],
      );

      Get.offNamed(Routes.LIST_USER, arguments: {"jenis_pasien": dataPasien["status_pasien"]});
      Get.snackbar("E-Puskesmas", "Data Berhasil Di Ubah");
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }

  //[x] Get user by id to initiate data for update
  void getPasienById(int idPasien) async {
    isLoading(true);
    final pasien = await PasienSql.getSinglePasienById(idPasien);
    dataPasien(pasien.last);

    emailController.value.text = dataPasien["email"];
    sandiController.value.text = dataPasien["password"];
    noRekamMedisController.value.text = dataPasien["no_rekam_medis"];
    noBpjsController.value.text = dataPasien["no_bpjs"];
    namaController.value.text = dataPasien["nama_lengkap"];
    namaKKController.value.text = dataPasien["nama_kk"];
    tanggalLahirController.value.text = dataPasien["tanggal_lahir"];
    tempatLahirController.value.text = dataPasien["tempat_lahir"];
    usiaController.value.text = dataPasien["usia"];

    genderValue.value = dataPasien["jenis_kelamin"];
    detailAlamatController.value.text = dataPasien["detail_alamat"];

    fotoKk(dataPasien["kk_path"]);
    fotoKtp(dataPasien["ktp_path"]);
    fotoBpjs(dataPasien["bpjs_path"]);

    isLoading(false);
  }
}
