import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ten_ambulance_onboarding/components/app_topbar.dart';
import 'package:ten_ambulance_onboarding/components/floating_action_button.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

Widget mainLayout({
  required BuildContext context,
  required Widget child,
  required Screen screen,
}) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.light, // iOS
    ),
    child: Scaffold(
      appBar: appTopbar(screen: screen),
      body: child,
      floatingActionButton: floatingActionButton(
        context: context,
        screen: screen,
      ),
    ),
  );
}
