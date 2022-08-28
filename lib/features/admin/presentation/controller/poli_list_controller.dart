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

  final poliList = List<Map<String, dynamic>>.empty().obs;

  final args = Get.arguments;

  @override
  void onInit() {
    if (args["jenis_poli"] != null) {
      getAllPoli(args["jenis_poli"]);
    }
    super.onInit();
  }

  void getAllPoli(String jenisPoli) async {
    final poli = await PoliSql.getpoli();
    for (var element in poli) {
      if (element['jenis_poli'] == jenisPoli) {
        poliList.add(element);
      }
    }
  }
}
