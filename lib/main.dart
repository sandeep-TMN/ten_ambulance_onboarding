import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/screen/auth/login.dart';
import 'package:ten_ambulance_onboarding/screen/auth/login_phone_no.dart';
import 'package:ten_ambulance_onboarding/screen/auth/register.dart';
import 'package:ten_ambulance_onboarding/screen/auth/otp_validation.dart';
import 'package:ten_ambulance_onboarding/screen/counter.dart';
import 'package:ten_ambulance_onboarding/screen/home.dart';
import 'package:ten_ambulance_onboarding/screen/root.dart';
import 'package:ten_ambulance_onboarding/utils/init_controllers.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initControllers();
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final ScreenStateController screenStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: screenStateController.currentScreen.value.name,
      getPages: [
        GetPage(name: Screen.root.name, page: () => RootScreen()),
        GetPage(name: Screen.home.name, page: () => HomeScreen()),
        GetPage(name: Screen.login.name, page: () => LoginScreen()),
        GetPage(
          name: Screen.loginPhoneNo.name,
          page: () => PhoneNoLoginScreen(),
        ),
        GetPage(
          name: Screen.otpValidation.name,
          page: () => OtpValidationScreen(),
        ),

        GetPage(name: Screen.register.name, page: () => RegisterScreen()),
        GetPage(name: Screen.counter.name, page: () => Counter()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
