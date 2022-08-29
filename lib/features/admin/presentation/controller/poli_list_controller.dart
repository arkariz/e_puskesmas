import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PoliListController extends GetxController {
  final _namaPasien = TextEditingController().obs;
  set namaPasien(value) => _namaPasien.value = value;
  TextEditingController get namaPasien => _namaPasien.value;

  final _namaPasienNode = FocusNode().obs;
  set namaPasienNode(value) => _namaPasienNode.value = value;
  FocusNode get namaPasienNode => _namaPasienNode.value;

  final jenisPasien = "".obs;

  final poliList = List<Map<String, dynamic>>.empty().obs;

  final jenisPoli = "".obs;
  final dayTitle = "Pasien Terbaru".obs;
  final dayFilter = "".obs;

  final args = Get.arguments;

  @override
  void onInit() {
    if (args["jenis_poli"] != null) {
      jenisPoli(args["jenis_poli"]);
      jenisPasien(args["jenis_pasien"]);
      getAllPoli(args["jenis_poli"]);
    }
    super.onInit();
  }

  Future getAllPoli(String jenisPoli) async {
    final poli = await PoliSql.getPoliByJenisPasien(jenisPasien.value);
    final tempPoli = List<Map<String, dynamic>>.empty(growable: true);

    for (var element in poli) {
      if (element['jenis_poli'] == jenisPoli) {
        tempPoli.add(element);
      }
    }

    poliList.assignAll(tempPoli);
  }

  void searchPoliByName(String nama) async {
    final tempPoli = List<Map<String, dynamic>>.empty(growable: true);

    if (nama.isNotEmpty) {
      if (poliList.isNotEmpty) {
        for (var element in poliList) {
          if (element.containsValue(nama)) {
            tempPoli.add(element);
          }
        }
      } else {
        if (dayTitle.value != "Pasien Terbaru") {
          await filterByDay(dayFilter.value);
          for (var element in poliList) {
            if (element.containsValue(nama)) {
              tempPoli.add(element);
            } else {
              poliList.clear();
            }
          }
        } else {
          await getAllPoli(jenisPoli.value);
          for (var element in poliList) {
            if (element.containsValue(nama)) {
              tempPoli.add(element);
            } else {
              poliList.clear();
            }
          }
        }
      }

      poliList.assignAll(tempPoli);
    } else {
      await getAllPoli(jenisPoli.value);
    }
  }

  Future filterByDay(String day) async {
    dayFilter(day);
    final tempPoli = List<Map<String, dynamic>>.empty(growable: true);
    await getAllPoli(jenisPoli.value);

    for (var element in poliList) {
      if (element['jadwal'].toString().contains(dayFilter.value)) {
        tempPoli.add(element);
      }
    }

    poliList.assignAll(tempPoli);

    switch (dayFilter.value) {
      case "Sen":
        dayTitle("Hari Senin");
        break;
      case "Sel":
        dayTitle("Hari Selasa");
        break;
      case "Rab":
        dayTitle("Hari Rabu");
        break;
      case "Kam":
        dayTitle("Hari Kamis");
        break;
      case "Jum":
        dayTitle("Hari Jumat");
        break;
      case "Sab":
        dayTitle("Hari Sabtu");
        break;
      case "Min":
        dayTitle("Hari Minggu");
        break;
      default:
        dayTitle("Pasien Terbaru");
    }
  }
}
