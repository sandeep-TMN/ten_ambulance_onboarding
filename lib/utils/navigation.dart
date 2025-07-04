enum Screen {
  root('/root'),

  login('/login'),
  loginPhoneNo('/login_phone_no'),
  otpValidation('/otp_validation'),
  register('/register'),

  home('/home'),
  counter('/counter'),

  unknown('');

  final String name;
  const Screen(this.name);
}

Screen screenFromRoute(String route) {
  final path = route.split('?').first;
  return Screen.values.firstWhere(
    (screen) => screen.name == path,
    orElse: () => Screen.unknown,
  );
}
