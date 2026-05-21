import 'dart:io';

import 'package:dio/dio.dart';
import 'package:posts_app/core/constants/api_constants.dart';
import 'auth_interceptor.dart';

class ApiHelper {
  late final Dio _dio;

  ApiHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.server,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(AuthInterceptor());

  }

  Future<Response> getData(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> getById(String endpoint, String id) async {
    try {
      final response = await _dio.get('$endpoint/$id');
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> postData(
      String endpoint,
      Map<String, dynamic> data, {
        bool requiresAuth = true,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: Options(
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }



  Future<Response> postMultipartData(
      String endpoint,
      Map<String, dynamic> data, {
        bool requiresAuth = true,
      }) async {
    try {
      final Map<String, dynamic> finalFormMap = {};

      for (var entry in data.entries) {
        final key = entry.key;
        final value = entry.value;

        if (value is File) {

          final String fileName = value.path.split('/').last;
          finalFormMap[key] = await MultipartFile.fromFile(
            value.path,
            filename: fileName,
          );
        } else if (value is List<File>) {
          final List<MultipartFile> multipartFiles = [];
          for (var file in value) {
            final String fileName = file.path.split('/').last;
            multipartFiles.add(await MultipartFile.fromFile(
              file.path,
              filename: fileName,
            ));
          }
          finalFormMap[key] = multipartFiles;
        } else {
          finalFormMap[key] = value;
        }
      }

      final formData = FormData.fromMap(finalFormMap);

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Local fallback error message handler
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with server!';
      case DioExceptionType.badResponse:
        return error.response?.data['message'] ?? 'Server error occurred!!';
      default:
        return 'Something went wrong. Please try again!';
    }
  }
}