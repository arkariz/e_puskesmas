import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../controller/navigation_controller.dart';

class NavigationBottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBottomController>(
      () => NavigationBottomController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
