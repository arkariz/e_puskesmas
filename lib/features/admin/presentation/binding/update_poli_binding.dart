import 'package:e_puskesmas/features/admin/presentation/controller/update_poli_controller.dart';
import 'package:get/get.dart';

class UpdatePoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePoliController>(
      () => UpdatePoliController(),
    );
  }
}
