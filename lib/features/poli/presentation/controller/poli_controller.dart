import 'dart:math';

import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:get/get.dart';

class PoliController extends GetxController {
  final args = Get.arguments;

  var jenisPoli = "".obs;
  var namaPasien = "".obs;
  var jenisPasien = "".obs;
  var waktu = "".obs;
  var tanggal = "".obs;
  var dokterValue = "".obs;

  final List<String> dokterItems = [
    'Laki-Laki',
    'Perempuan',
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
    await PoliSql.createpoli(
      generateRandomString(5),
      jenisPoli.value,
      namaPasien.value,
      jenisPasien.value,
      dokterValue.value,
      waktu.value,
      tanggal.value,
    );

    Get.offNamed(Routes.HOME);
  }

  void getPoli() async {
    var poli = await PoliSql.getpoli();
    print(poli.last["kode_antrian"]);
    print(poli.last["waktu"]);
    print(poli.last["tanggal"]);
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

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
