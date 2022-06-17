import 'package:e_puskesmas/features/poli/presentation/controller/poli_ticket_list_controller.dart';
import 'package:get/get.dart';

class PoliTicketListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliTicketListController>(
      () => PoliTicketListController(),
    );
  }
}
