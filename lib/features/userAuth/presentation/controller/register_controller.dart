import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/utils/image_picker.dart';
import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final namaController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final sandiController = TextEditingController().obs;

  final noRekamMedisController = TextEditingController().obs;
  final noBpjsController = TextEditingController().obs;
  final namaKKController = TextEditingController().obs;
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

  final tanggalLahir = "".obs;
  final fotoKk = "".obs;
  final fotoKtp = "".obs;
  final fotoBpjs = "".obs;

  final statusPasien = "".obs;
  final isAdmin = false.obs;

  final args = Get.arguments;

  final List<String> menuItems = [
    'Laki-Laki',
    'Perempuan',
  ].obs;

  var genderValue = "".obs;

  void onSelectGender(String value) {
    genderValue(value);
  }

  void onSelectedTanggal(String value) {
    tanggalLahir(value);
  }

  @override
  void onInit() {
    if (args != null) {
      if (args["jenis_pasien"] != null) {
        statusPasien(args["jenis_pasien"]);
      }

      if (args["isAdmin"] != null) {
        isAdmin(args["isAdmin"]);
      }
    }
    super.onInit();
  }

  // [x] Revisi Pasien Field
  void createPasien() async {
    try {
      await PasienSql.createPasien(
        statusPasien.value,
        emailController.value.text,
        sandiController.value.text,
        noRekamMedisController.value.text,
        noBpjsController.value.text,
        namaController.value.text,
        namaKKController.value.text,
        tanggalLahir.value,
        tempatLahirController.value.text,
        usiaController.value.text,
        genderValue.value,
        detailAlamatController.value.text,
        fotoKk.value,
        fotoKtp.value,
        fotoBpjs.value,
        "profilePath",
      );

      if (isAdmin.value) {
        Get.offNamedUntil(Routes.LIST_USER, ModalRoute.withName(Routes.PILIH_PASIEN), arguments: {"jenis_pasien": statusPasien.value});
      } else {
        Get.offNamed(Routes.LOGIN);
      }
      Get.snackbar("E-Puskesmas", "Pendaftaran Berhasil");
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }

  Future openBottomModal(BuildContext context, String jenisDokumen) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () async {
                try {
                  await PickImage().getImage(ImageSource.camera).then((file) {
                    if (jenisDokumen == "kk") {
                      fotoKk(file.path);
                    } else if (jenisDokumen == "bpjs") {
                      fotoBpjs(file.path);
                    } else {
                      fotoKtp(file.path);
                    }
                  });

                  Get.back();
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () async {
                try {
                  await PickImage().getImage(ImageSource.gallery).then((file) {
                    if (jenisDokumen == "kk") {
                      fotoKk(file.path);
                    } else if (jenisDokumen == "bpjs") {
                      fotoBpjs(file.path);
                    } else {
                      fotoKtp(file.path);
                    }
                  });

                  Get.back();
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        );
      },
    );
  }

  //Hapus cache gambar
  deleteImage(String jenisDokumen) {
    if (jenisDokumen == "kk") {
      fotoKk("");
    } else if (jenisDokumen == "bpjs") {
      fotoBpjs("");
    } else {
      fotoKtp("");
    }
  }
}
