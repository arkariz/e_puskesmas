import 'package:e_puskesmas/features/poli/presentation/controller/poli_tiket_controller.dart';
import 'package:get/get.dart';

class PoliTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliTicketController>(
      () => PoliTicketController(),
    );
  }
}
