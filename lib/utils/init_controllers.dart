import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/controllers/counter_controller.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';

Future<void> initControllers() async {
  await Get.putAsync(() async => CounterController());
  await Get.putAsync(() async => ScreenStateController());
}
