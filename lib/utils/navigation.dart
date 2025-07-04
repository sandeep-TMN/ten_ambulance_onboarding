enum Screen {
  root("/root"),
  home("/home"),
  login("/login"),
  loginPhoneNo("/login_phone_no"),
  register("/register"),
  counter("/counter"),
  unknown('');

  final String name;
  const Screen(this.name);
}

Screen screenFromRoute(String route) {
  return Screen.values.firstWhere(
    (screen) => screen.name == route,
    orElse: () => Screen.unknown,
  );
}
