import 'package:e_puskesmas/features/userAuth/presentation/controller/login_controller.dart';
import 'package:e_puskesmas/features/userAuth/presentation/controller/register_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
