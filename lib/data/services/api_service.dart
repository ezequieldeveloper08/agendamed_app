import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mediup/utils/server_exception.dart';

class ApiService {
  final Dio _dio;
  final Logger _logger = Logger();

  ApiService({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? "https://api.exemplo.com",
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.i("➡️ [REQUEST] ${options.method} ${options.uri}");
          _logger.d("Headers: ${options.headers}");
          if (options.data != null) {
            _logger.d("Body: ${options.data}");
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i(
            "✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}",
          );
          _logger.d("Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _logger.e("❌ [ERROR] ${e.response?.statusCode} ${e.message}");
          if (e.response != null) {
            _logger.e("Data: ${e.response?.data}");
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ServerException _handleError(DioException e) {
    return ServerException(
      message: e.message ?? "Erro desconhecido no servidor",
      statusCode: e.response?.statusCode,
      data: e.response?.data,
    );
  }
}
