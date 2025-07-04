import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/api/services/user_api.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/components/ui/text_input.dart';
import 'package:ten_ambulance_onboarding/controllers/screen_state_controller.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/app_logger.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class PhoneNoLoginScreen extends StatefulWidget {
  const PhoneNoLoginScreen({super.key});

  @override
  State<PhoneNoLoginScreen> createState() => _PhoneNoLoginScreen();
}

class _PhoneNoLoginScreen extends State<PhoneNoLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNo = TextEditingController();
  final userApi = UserApi();
  final ScreenStateController screenStateController = Get.find();

  var _loading = false;

  @override
  void dispose() {
    _phoneNo.dispose();
    super.dispose();
  }

  void _gotToOtpValidation(String phoneNo) {
    screenStateController.goTo(
      screen: Screen.otpValidation,
      params: {'phoneNo': phoneNo, 'countryCode': '+91'},
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_loading) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      if (_phoneNo.text.length == 10) {
        setState(() {
          _loading = true;
        });
        _gotToOtpValidation(_phoneNo.text);
        setState(() {
          _loading = false;
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
        logger.i("invalid number");
      }
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.22),
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: AppTextInput(
                  controller: _phoneNo,
                  hintText: '  Enter Phone Number',
                  prefixIcon: Iconsax.call_outline,
                  textInputType: TextInputType.phone,
                  textInputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: ElevatedButton(
                  onPressed: _submit,
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
                            Text("Sending otp ..."),
                            SizedBox(width: 15),
                            loadingSpinner(size: 15),
                          ]
                        : [
                            Text("Generate OTP"),
                            SizedBox(width: 10),
                            Icon(Iconsax.message_2_outline, size: 22),
                          ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      screen: currentScreen,
    );
  }
}
