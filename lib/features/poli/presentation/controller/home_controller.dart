import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> pasien = Get.arguments;

  var namaPasien = "".obs;
  var statusPasien = "".obs;

  @override
  void onInit() {
    namaPasien(pasien.last['nama_lengkap']);
    statusPasien(pasien.last['status_pasien']);
    super.onInit();
  }
}
