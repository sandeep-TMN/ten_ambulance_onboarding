import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/components/ui/text_input.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
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
  var isChecked = false;

  @override
  void dispose() {
    _phoneNo.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed
      print('Phone: ${_phoneNo.text}');
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
                  'Welcome Back,',
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
                    children: [
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
