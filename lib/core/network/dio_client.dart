import 'package:dio/dio.dart';
import 'package:hungry/core/utils/pref_helpers.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {"Content-Type": 'application/json'},
    ),
  );

  DioClient() {
    // _dio.interceptors.add(
    //   LogInterceptor(requestBody: true, responseBody: true),
    // );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = "708|IExGoshy4rKXQIHb9IHlb9Xg7iSOgsM19Y3VURgb35eeaccd";
          // await PrefHelper.getToken();
          print(' API Request to: ${options.path}');
          print(' Token for request: ${token ?? 'null'}');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            print('Authorization header added');
          } else {
            print('No authorization header added');
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
