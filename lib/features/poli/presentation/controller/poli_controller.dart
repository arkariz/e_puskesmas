import 'dart:math';

import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:e_puskesmas/features/poli/domain/repositories/dokter_repository.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_ticket_list_controller.dart';
import 'package:get/get.dart';

class PoliController extends GetxController {
  final args = Get.arguments;
  final repo = DokterRepository();

  var kodeAntrian = "".obs;
  var jenisPoli = "".obs;
  var namaPasien = "".obs;
  var jenisPasien = "".obs;

  final dokterList = List<String>.empty().obs;
  final jadwalList = List<String>.empty().obs;
  final selectedDokter = "".obs;
  final selectedJadwal = "".obs;

  @override
  void onInit() {
    if (args != null) {
      namaPasien(args["nama"]);
      jenisPasien(args["jenis_pasien"]);
      jenisPoli(args["poli"]);
    }
    getDokterData();
    super.onInit();
  }

  void getDokterData() {
    final dokter = repo.getDokter(jenisPoli.value);
    for (var element in dokter) {
      dokterList.add(element!);
    }
  }

  void getJadwalData(String dokter) {
    jadwalList.clear();
    final jadwal = repo.getJadwal(dokter);
    for (var element in jadwal) {
      jadwalList.add(element);
    }
  }

  void onSelectedDokter(String value) {
    selectedDokter(value);
    getJadwalData(selectedDokter.value);
  }

  void onSelectedJadwal(String value) {
    selectedJadwal(value);
  }

  void createPoli(int idPasien) async {
    generateRandomString(5);
    await PoliSql.createpoli(
      kodeAntrian.value,
      jenisPoli.value,
      namaPasien.value,
      jenisPasien.value,
      selectedDokter.value,
      selectedJadwal.value,
      idPasien,
    );

    Get.find<PoliTicketListController>().getAllPoliByPasienId();

    Get.offNamed(Routes.POLI_TICKET, arguments: {
      "cache_poli": [
        kodeAntrian.value,
        jenisPoli.value,
        namaPasien.value,
        jenisPasien.value,
        selectedDokter.value,
        selectedJadwal.value,
      ]
    });
  }

  void generateRandomString(int length) {
    final random = Random();
    const availableChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length, (index) => availableChars[random.nextInt(availableChars.length)]).join();
    kodeAntrian(randomString);
  }
}
