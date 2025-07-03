import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/app_storage.dart';
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
    // checkLogin();

    return mainLayout(
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                child: Image.asset('assets/images/logo_ten.png'),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 36,
                  child: Image.asset('assets/images/logo_ten_name.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Text(
            'Welcome to TEN - Total Emergency Network',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'FunnelSans',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 176, 89, 17),
            ),
          ),
          SizedBox(height: 8),
          ambulanceWaiting(),
          SizedBox(width: double.infinity, height: 36, child: loading()),
          SizedBox(height: 30),
        ],
      ),
      screen: currentScreen,
    );
  }
}
