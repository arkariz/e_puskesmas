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
    'Yogyakarta',
  ].obs;

  var provValue = "".obs;

  void onSelectProv(String value) {
    provValue(value);
  }

  final List<String> kabItems = [
    'Sleman',
    'Bantul',
  ].obs;

  var kabValue = "".obs;

  void onSelectkab(String value) {
    kabValue(value);
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
        fotoKk.value,
        fotoKtp.value,
        fotoBpjs.value,
      );

      Get.offNamed(Routes.LOGIN);
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
