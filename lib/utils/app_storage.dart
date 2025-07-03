import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

enum StorageKey {
  authToken('auth_token'),
  refreshToken('refresh_token'),
  username('username'),
  email('email'),
  firstName('first_name'),
  lastName('last_name');

  final String value;
  const StorageKey(this.value);
}

Future<void> saveLoginData({
  required String authToken,
  required String refreshToken,
  required String username,
  required String email,
  required String firstName,
  required String lastName,
}) async {
  await storage.write(key: StorageKey.authToken.value, value: authToken);
  await storage.write(key: StorageKey.refreshToken.value, value: refreshToken);
  await storage.write(key: StorageKey.username.value, value: username);
  await storage.write(key: StorageKey.email.value, value: email);
  await storage.write(key: StorageKey.firstName.value, value: firstName);
  await storage.write(key: StorageKey.lastName.value, value: lastName);
}

Future<void> saveAuthToken({required String token}) async {
  await storage.write(key: StorageKey.authToken.value, value: token);
}

Future<Map<String, String?>> getUserData() async {
  final authToken = await storage.read(key: StorageKey.authToken.value);
  final username = await storage.read(key: StorageKey.username.value);
  final email = await storage.read(key: StorageKey.email.value);
  final firstName = await storage.read(key: StorageKey.firstName.value);
  final lastName = await storage.read(key: StorageKey.lastName.value);
  return {
    StorageKey.authToken.value: authToken,
    StorageKey.username.value: username,
    StorageKey.email.value: email,
    StorageKey.firstName.value: firstName,
    StorageKey.lastName.value: lastName,
  };
}

Future<bool> isLoggedIn() async {
  await Future.delayed(Duration(milliseconds: 5000));
  return false;
}

Future<void> logout() async {
  await storage.deleteAll();
}
