import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/app_storage.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  final ScreenStateController screenStateController = Get.find();

  void checkLogin() async {
    final status = await isLoggedIn();
    if (status) {
      screenStateController.goTo(screen: Screen.home, replace: true);
    } else {
      screenStateController.goTo(screen: Screen.login, replace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    final currentScreen = screenFromRoute(currentRoute);
    checkLogin();

    return mainLayout(
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            'Welcome User',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 24,
              fontFamily: 'FunnelSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'TEN - Total Emergency network',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'FunnelSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 80),
          ambulanceWaiting(),
          SizedBox(width: double.infinity, height: 36, child: loading()),
        ],
      ),
      screen: currentScreen,
    );
  }
}
