import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/components/animations.dart';
import 'package:ten_ambulance_onboarding/components/ui/text_input.dart';
import 'package:ten_ambulance_onboarding/layouts/main_layout.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _handler = TextEditingController();
  final _password = TextEditingController();
  var _checked = false;
  var _loading = false;

  @override
  void dispose() {
    _handler.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_loading) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed
      print('Email: ${_handler.text}');
      print('Password: ${_password.text}');
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
                  controller: _handler,
                  hintText: 'Email',
                  prefixIcon: Iconsax.user_octagon_outline,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: AppTextInput(
                  controller: _password,
                  hintText: 'Password',
                  prefixIcon: Iconsax.lock_circle_outline,
                  protected: true,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _checked,
                          onChanged: (bool? value) {
                            setState(() {
                              _checked = !_checked;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Forgot Password?'),
                    ),
                  ],
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
                            Text("Authenticating..."),
                            SizedBox(width: 15),
                            loadingSpinner(size: 15),
                          ]
                        : [
                            Text("Login"),
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
