import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PoliTicketController extends GetxController {
  final args = Get.arguments;

  var kodeAntrian = "".obs;
  var jenisPoli = "".obs;
  var namaPasien = "".obs;
  var jenisPasien = "".obs;
  var jadwal = "".obs;
  var dokterValue = "".obs;

  final isLoginAs = "".obs;

  @override
  void onInit() {
    checkLoginAs();

    if (args != null) {
      if (args["id_poli"] != null) {
        getPoliById(args["id_poli"]);
      } else {
        final poli = args["cache_poli"];
        kodeAntrian(poli[0]);
        jenisPoli(poli[1]);
        namaPasien(poli[2]);
        jenisPasien(poli[3]);
        dokterValue(poli[4]);
        jadwal(poli[5]);
      }
    }
    super.onInit();
  }

  void checkLoginAs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? isLogin = prefs.getString("isLogin");
    isLoginAs(isLogin);
  }

  void getPoliById(int idPoli) async {
    final poli = await PoliSql.getSinglepoli(idPoli);
    kodeAntrian(poli.last["kode_antrian"]);
    jenisPoli(poli.last["jenis_poli"]);
    namaPasien(poli.last["nama_pasien"]);
    jenisPasien(poli.last["jenis_pasien"]);
    dokterValue(poli.last["dokter"]);
    jadwal(poli.last["jadwal"]);
  }
}
