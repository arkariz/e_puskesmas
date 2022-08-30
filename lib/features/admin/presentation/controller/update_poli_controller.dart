import 'dart:developer';

import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:e_puskesmas/features/poli/domain/repositories/dokter_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePoliController extends GetxController {
  final repo = DokterRepository();

  final namaController = TextEditingController().obs;
  final selectedDokter = "".obs;
  final riwayat = "".obs;

  final namaNode = FocusNode().obs;
  final statusNode = FocusNode().obs;
  final poliNode = FocusNode().obs;
  final dokterNode = FocusNode().obs;
  final riwayatNode = FocusNode().obs;

  final dataPoli = {}.obs;
  final isLoading = false.obs;
  final kodeAntrian = "".obs;
  final dokterList = List<String>.empty().obs;

  final args = Get.arguments;

  final List<String> statusItems = [
    'Pasien Umum',
    'Pasien BPJS',
  ].obs;

  final List<String> poliItems = [
    'Poli Umum',
    'Poli KB',
    'Poli KIA',
    'Poli Anak',
  ].obs;

  var statusValue = "".obs;
  var poliValue = "".obs;

  @override
  void onInit() async {
    if (args != null) {
      kodeAntrian(args['kode_antrian']);
      await getPoliByAntrian(args['kode_antrian']);
      getDokterData();
    }
    super.onInit();
  }

  void onSelectedTanggal(String value) {
    riwayat(value);
  }

  Future getDokterData() async {
    final dokter = repo.getDokter(poliValue.value);
    final tempDokter = List<String>.empty(growable: true);
    for (var element in dokter) {
      tempDokter.add(element!);
    }

    dokterList.assignAll(tempDokter);
  }

  void onSelectedDokter(String value) {
    selectedDokter(value);
  }

  String? initDokterValue() {
    if (selectedDokter.value != "") {
      return dokterList.singleWhere((element) => element == selectedDokter.value);
    }
    return null;
  }

  Future getPoliByAntrian(String kodeAntrian) async {
    isLoading(true);
    final poli = await PoliSql.getPoliByAntrian(kodeAntrian);
    dataPoli(poli.last);

    namaController.value.text = dataPoli['nama_pasien'];
    statusValue.value = dataPoli['jenis_pasien'];
    poliValue.value = dataPoli['jenis_poli'];
    selectedDokter.value = dataPoli['dokter'];
    riwayat.value = dataPoli['jadwal'];

    isLoading(false);
  }

  void updatePoli() async {
    try {
      await PoliSql.updatepoli(
        kodeAntrian.value,
        poliValue.value,
        namaController.value.text,
        statusValue.value,
        selectedDokter.value,
        riwayat.value,
      );

      Get.offNamed(Routes.LIST_POLI_ADMIN, arguments: {
        "jenis_poli": poliValue.value,
        "jenis_pasien": statusValue.value,
      });
      Get.snackbar("E-Puskesmas", "Data Berhasil Di Ubah");
    } catch (e) {
      Get.snackbar("E-Puskesmas", "Terjadi Kesalahan");
    }
  }

  void onSelectStatus(String value) {
    statusValue(value);
  }

  String? initStatusValue() {
    if (statusValue.value != "") {
      return statusItems.singleWhere((element) => element == statusValue.value);
    }
    return null;
  }

  void onSelectPoli(String value) async {
    poliValue(value);
    selectedDokter("");
    await getDokterData();
  }

  String? initPoliValue() {
    if (poliValue.value != "") {
      return poliItems.singleWhere((element) => element == poliValue.value);
    }
    return null;
  }
}
