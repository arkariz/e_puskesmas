import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
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
      if (args["id_poli"] != null) {
        getPoliById(args["id_poli"]);
      } else {
        final poli = args["cache_poli"];
        kodeAntrian(poli[0]);
        jenisPoli(poli[1]);
        namaPasien(poli[2]);
        jenisPasien(poli[3]);
        dokterValue(poli[4]);
        waktu(poli[5]);
        tanggal(poli[6]);
      }
    }
    super.onInit();
  }

  void getPoliById(int idPoli) async {
    final poli = await PoliSql.getSinglepoli(idPoli);
    kodeAntrian(poli.last["kode_antrian"]);
    jenisPoli(poli.last["jenis_poli"]);
    namaPasien(poli.last["nama_pasien"]);
    jenisPasien(poli.last["jenis_pasien"]);
    dokterValue(poli.last["dokter"]);
    waktu(poli.last["waktu"]);
    tanggal(poli.last["tanggal"]);
  }
}
