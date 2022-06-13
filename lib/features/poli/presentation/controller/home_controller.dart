import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var namaPasien = "".obs;
  var email = "".obs;
  var statusPasien = "".obs;

  @override
  void onInit() {
    getPasien();
    super.onInit();
  }

  void getPasien() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isLogin = prefs.getBool("isLogin");

    if (isLogin!) {
      final List<String>? pasien = prefs.getStringList('pasien');

      namaPasien(pasien![0]);
      statusPasien(pasien[1]);
      email(pasien[2]);
    }
  }
}
