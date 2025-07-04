import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/components/ui/text_input.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  var _loading = false;

  @override
  void dispose() {
    super.dispose();

    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_loading) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed
      print('FirstName: ${_firstName.text}');
      print('LastName: ${_lastName.text}');
      print('Email: ${_email.text}');
      setState(() {
        _loading = true;
      });
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
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
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: AppTextInput(
                  controller: _firstName,
                  hintText: 'First Name',
                  prefixIcon: Iconsax.user_octagon_outline,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: AppTextInput(
                  controller: _lastName,
                  hintText: 'Last Name',
                  prefixIcon: Iconsax.personalcard_outline,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: AppTextInput(
                  controller: _email,
                  hintText: 'Email',
                  prefixIcon: IonIcons.mail_unread,
                ),
              ),
              SizedBox(height: 20),
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
                            Text("Registering..."),
                            SizedBox(width: 15),
                            loadingSpinner(size: 15),
                          ]
                        : [
                            Text("Register"),
                            SizedBox(width: 5),
                            Icon(Iconsax.login_outline, size: 22),
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
