import 'package:e_puskesmas/features/admin/presentation/controller/poli_list_controller.dart';
import 'package:get/get.dart';

class PoliListAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliListController>(
      () => PoliListController(),
    );
  }
}
