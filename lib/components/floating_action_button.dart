import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/controllers/counter_controller.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

Widget? floatingActionButton({
  required BuildContext context,
  required Screen screen,
}) {
  final CounterController counterController = Get.find();
  final ScreenStateController screenStateController = Get.find();

  if (Screen.counter == screen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'navigator',
          onPressed: () {
            screenStateController.goTo(screen: Screen.home);
          },
          backgroundColor: Color(0xfff25a2a),
          foregroundColor: Colors.white,
          tooltip: 'navigate',
          child: const Icon(Icons.nat_sharp),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          heroTag: 'counter',
          onPressed: () {
            counterController.increment();
          },
          backgroundColor: Color(0xfff25a2a),
          foregroundColor: Colors.white,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
  if (Screen.home == screen) {
    return FloatingActionButton(
      onPressed: () {
        screenStateController.goTo(screen: Screen.counter);
      },
      backgroundColor: Color(0xfff25a2a),
      foregroundColor: Colors.white,
      tooltip: 'navigate',
      child: const Icon(Icons.nat_sharp),
    );
  }
  if (Screen.login == screen) {
    return FloatingActionButton(
      onPressed: () {
        screenStateController.goTo(screen: Screen.home);
      },
      backgroundColor: Color(0xfff25a2a),
      foregroundColor: Colors.white,
      tooltip: 'navigate',
      child: const Icon(Icons.nat_sharp),
    );
  }
  return null;
}
