import 'package:e_puskesmas/features/admin/presentation/controller/user_list_controller.dart';
import 'package:get/get.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
      () => UserListController(),
    );
  }
}
