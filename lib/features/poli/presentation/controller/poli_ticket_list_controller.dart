import 'package:e_puskesmas/features/poli/data/datasources/poli_sql.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PoliTicketListController extends GetxController {
  final listTicket = List<Map<String, dynamic>>.empty().obs;

  @override
  void onInit() {
    getAllPoliByPasienId();
    super.onInit();
  }

  void getAllPoliByPasienId() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? pasien = prefs.getStringList('pasien');

    final poli = await PoliSql.getPoliByPasienId(int.parse(pasien![0]));
    listTicket(poli);
  }
}
