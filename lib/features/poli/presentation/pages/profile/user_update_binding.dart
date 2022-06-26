import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_ticket_list_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/profile/controller/profile_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/profile/controller/user_update_controller.dart';
import 'package:get/get.dart';

class UserUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserUpdateController>(
      () => UserUpdateController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
