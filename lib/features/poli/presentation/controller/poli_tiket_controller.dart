import 'package:get/get.dart';

class PoliTicketController extends GetxController {
  final args = Get.arguments;

  var kodeAntrian = "".obs;
  var jenisPoli = "".obs;
  var namaPasien = "".obs;
  var jenisPasien = "".obs;
  var waktu = "".obs;
  var tanggal = "".obs;
  var dokterValue = "".obs;

  @override
  void onInit() {
    if (args != null) {
      kodeAntrian(args[0]);
      jenisPoli(args[1]);
      namaPasien(args[2]);
      jenisPasien(args[3]);
      waktu(args[4]);
      tanggal(args[5]);
      dokterValue(args[6]);
    }
    super.onInit();
  }
}
