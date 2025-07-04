import 'package:dio/dio.dart';
import 'package:ten_ambulance_onboarding/api/dio_server.dart';
import 'package:ten_ambulance_onboarding/utils/app_logger.dart';

class UserApi {
  final Dio _dio = ApiServer().client;

  Future<Response?> loginUser({
    required String handler,
    required String passwd,
  }) async {
    const url = '/api/user/login';
    try {
      final response = await _dio.post(
        url,
        data: {handler: handler, passwd: passwd},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
      return e.response;
    }
  }

  Future<Response?> sendOtp({required String phoneNo}) async {
    const url = '/api/user/send-otp';
    try {
      final response = await _dio.post(
        url,
        data: {phoneNo: phoneNo},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
      return e.response;
    }
  }

  Future<Response?> validateOtp({
    required String phoneNo,
    required String otp,
  }) async {
    const url = '/api/user/validate-otp';
    try {
      final response = await _dio.post(
        url,
        data: {phoneNo: phoneNo, otp: otp},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
      return e.response;
    }
  }

  Future<Response?> updateDetails({
    required String? firstName,
    required String? lastName,
    required String? email,
  }) async {
    const url = '/api/user/validate-otp';
    try {
      final response = await _dio.post(
        url,
        data: {firstName: firstName, lastName: lastName, email: email},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
      return e.response;
    }
  }

  Future<Response?> updatePasswd({
    required String oldPasswd,
    required String newPasswd,
  }) async {
    const url = '/api/user/validate-otp';
    try {
      final response = await _dio.post(
        url,
        data: {oldPasswd: oldPasswd, newPasswd: newPasswd},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
      return e.response;
    }
  }
}
