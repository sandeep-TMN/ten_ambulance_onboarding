import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget ambulanceWaiting() {
  return Center(child: Lottie.asset('assets/lottie/ambulance.json'));
}

Widget loading() {
  return Center(child: Lottie.asset('assets/lottie/loading.json'));
}

Widget loadingSpinner({
  double size = 20,
  Color color = Colors.white,
  double strokeWidth = 2,
}) {
  return SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(strokeWidth: strokeWidth, color: color),
  );
}
