import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PoliTicketListController extends GetxController {
  final listTicket = List<Map<String, dynamic>>.empty().obs;
  final args = Get.arguments;

  @override
  void onInit() {
    getAllPoliByPasienId();
    super.onInit();
  }

  //[ ] Poli list not state aware
  void getAllPoliByPasienId() async {
    if (args != null) {
      final poli = await PoliSql.getPoliByPasienId(args["id_pasien"]);
      listTicket(poli);
    } else {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? pasien = prefs.getStringList('pasien');

      final poli = await PoliSql.getPoliByPasienId(int.parse(pasien![0]));
      listTicket(poli);
    }
  }
}
