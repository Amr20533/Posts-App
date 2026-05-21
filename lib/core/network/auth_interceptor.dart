import 'package:dio/dio.dart';
import 'package:posts_app/core/services/data_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{

    final bool requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth) {
      final String? token = await DataStorage.instance.readData(
        DataStorage.keyAuthToken,
      );

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } else {
      print('--> Skipping Token Injection for Public Endpoint: ${options.path}');
    }

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  }
}