import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_controller.dart';
import 'package:get/get.dart';

class PoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliController>(
      () => PoliController(),
    );
  }
}
