import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ten_ambulance_onboarding/api/services/user_api.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/app_logger.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({super.key});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreen();
}

class _OtpValidationScreen extends State<OtpValidationScreen> {
  final _phoneNo = TextEditingController();
  final userApi = UserApi();

  TextEditingController otpController = TextEditingController();
  final ScreenStateController screenStateController = Get.find();
  var _loading = false;

  String otp = '';
  String phoneNo = 'xxxxx xxxxx';
  int countryCode = 91;

  @override
  void initState() {
    super.initState();

    final phoneNo = Get.parameters['phoneNo'] ?? '';
    final countryCode = Get.parameters['countryCode'] ?? '';

    final isPhoneValid = RegExp(r'^\d{10}$').hasMatch(phoneNo);
    final parsedCountryCode = int.tryParse(countryCode);
    if (!isPhoneValid || parsedCountryCode == null) {
      screenStateController.goTo(screen: Screen.loginPhoneNo, replace: true);
      return;
    }

    setState(() {
      this.phoneNo = "${phoneNo.substring(0, 5)} ${phoneNo.substring(5, 10)}";
      this.countryCode = parsedCountryCode;
    });
  }

  @override
  void dispose() {
    _phoneNo.dispose();
    super.dispose();
  }

  void _submit(String otp) {
    FocusScope.of(context).unfocus();
    if (_loading) {
      return;
    }
    if (otp.length == 6) {
      setState(() {
        _loading = true;
      });
      // try {
      //   userApi.sendOtp(phoneNo: _phoneNo.text);
      // } on Exception catch (e) {
      //   logger.e(e);
      // } finally {
      //   setState(() {
      //     _loading = false;
      //   });
      // }
    } else {
      logger.i("invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    final currentScreen = screenFromRoute(currentRoute);

    const horizontalPadding = 20.0;
    const verticalPadding = 6.0;

    return mainLayout(
      context: context,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/logo_ten.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              width: double.infinity,
              child: Text(
                'Welcome to TEN,',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              width: double.infinity,
              child: Text(
                'Total Emergency Network - Bring Hope, Care and Excellence.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Text('Enter OTP received on +$countryCode $phoneNo'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: SizedBox(
                width: 390,
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  onCompleted: (value) {
                    logger.i("Completed OTP: $value");
                    _submit(value);
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: ElevatedButton(
                onPressed: () {
                  _submit(otp);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _loading
                      ? [
                          Text("Submitting otp ..."),
                          SizedBox(width: 15),
                          loadingSpinner(size: 15),
                        ]
                      : [
                          Text("Validate OTP"),
                          SizedBox(width: 10),
                          Icon(Iconsax.message_2_outline, size: 22),
                        ],
                ),
              ),
            ),
          ],
        ),
      ),
      screen: currentScreen,
    );
  }
}
