import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> pasien = Get.arguments;

  var namaLengkap = "".obs;
  var statusPasien = "".obs;

  @override
  void onInit() {
    namaLengkap(pasien.last['nama_lengkap']);
    statusPasien(pasien.last['status_pasien']);
    super.onInit();
  }
}
