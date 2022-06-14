import 'package:get/get.dart';

class NavigationBottomController extends GetxController {
  var currentIndex = 0.obs;

  changePage(int i) {
    currentIndex.value = i;
  }
}
