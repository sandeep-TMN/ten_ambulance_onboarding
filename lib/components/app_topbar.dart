import 'package:flutter/material.dart';
import 'package:ten_ambulance_onboarding/utils/navigation.dart';

PreferredSizeWidget? appTopbar({required Screen screen}) {
  if (Screen.counter == screen) {
    return AppBar(
      title: Text('TEN - Onboarding', style: TextStyle(fontFamily: 'WorkSans')),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff25a2a), Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
  return null;
}
