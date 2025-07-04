import 'package:dio/dio.dart';

class ApiServer {
  late Dio _dio;

  ApiServer() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:5000/',
      connectTimeout: Duration(seconds: 30),
    );

    _dio = Dio(options);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer TOKEN';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
