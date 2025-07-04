import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class ScreenStateController extends GetxController {
  var currentScreen = Screen.home.obs;

  void goTo({
    required Screen screen,
    bool replace = false,
    bool emptyStack = false,
    Map<String, String> params = const {},
  }) {
    currentScreen.value = screen;
    if (emptyStack) {
      Get.offAllNamed(screen.name, parameters: params);
    } else if (replace) {
      Get.offNamed(screen.name, parameters: params);
    } else {
      Get.toNamed(screen.name, parameters: params);
    }
  }
}
