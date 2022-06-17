import 'dart:math';

import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:get/get.dart';

class PoliController extends GetxController {
  final args = Get.arguments;

  var kodeAntrian = "".obs;
  var jenisPoli = "".obs;
  var namaPasien = "".obs;
  var jenisPasien = "".obs;
  var waktu = "".obs;
  var tanggal = "".obs;
  var dokterValue = "".obs;

  final List<String> dokterItems = [
    'Shavira Mediana',
    'Putri Amanda',
    'Ahmad Budi',
    'Galang Baskara',
  ].obs;

  @override
  void onInit() {
    if (args != null) {
      namaPasien(args["nama"]);
      jenisPasien(args["jenis_pasien"]);
      jenisPoli(args["poli"]);
    }
    super.onInit();
  }

  void createPoli() async {
    generateRandomString(5);
    await PoliSql.createpoli(
      kodeAntrian.value,
      jenisPoli.value,
      namaPasien.value,
      jenisPasien.value,
      dokterValue.value,
      waktu.value,
      tanggal.value,
    );

    Get.offNamed(Routes.POLI_TICKET, arguments: [
      kodeAntrian.value,
      jenisPoli.value,
      namaPasien.value,
      jenisPasien.value,
      dokterValue.value,
      waktu.value,
      tanggal.value,
    ]);
  }

  void onSelectDokter(String value) {
    dokterValue(value);
  }

  void onSelectDate(String value) {
    tanggal(value);
  }

  void onSelectTime(String value) {
    waktu(value);
  }

  void generateRandomString(int len) {
    var r = Random();
    kodeAntrian(String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89)));
  }
}
