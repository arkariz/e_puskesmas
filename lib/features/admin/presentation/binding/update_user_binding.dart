import 'package:e_puskesmas/features/admin/presentation/controller/update_controller.dart';
import 'package:get/get.dart';

class UpdateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateController>(
      () => UpdateController(),
    );
  }
}
