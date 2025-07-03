import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class ScreenStateController extends GetxController {
  var currentScreen = Screen.root.obs;

  void goTo({required Screen screen, bool replace = false}) {
    currentScreen.value = screen;
    if (replace) {
      Get.offNamed(screen.name);
    } else {
      Get.toNamed(screen.name);
    }
  }
}
