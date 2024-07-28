import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'exceptions.dart';

const _authToken = '';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000/api'));

  final Map<String, String>? headers;

  ApiClient({this.headers}) {
    dio.options.headers = headers;
    //todo if there is any auth_tokens uncomment here
    // dio.options.headers.putIfAbsent(
    //   "Authorization",
    //   () => "Bearer ${authToken ?? _authToken}",
    // );
    dio.options.headers.putIfAbsent("Access-Control-Allow-Origin", () => '*');
    dio.options.headers.putIfAbsent("Content-Type", () => "application/json");
  }

  Future<Either<Exception, T>> _handleResponse<T>(
    Future<Response> request,
  ) async {
    try {
      final response = await request;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final data = response.data;
        return right(data);
      } else {
        return left(ApiErrorHandler.handleError(response.data));
      }
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }

  Future<Either<Exception, T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final request = dio.get(url,
        options: Options(headers: headers, validateStatus: (status) => true),
        queryParameters: {
          if (queryParameters != null) ...queryParameters,
        });
    return _handleResponse<T>(request);
  }

  Future<Either<Exception, T>> post<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final request = dio.post(
      url,
      options: Options(headers: headers, validateStatus: (status) => true),
      data: data,
      queryParameters: queryParameters,
    );
    return _handleResponse<T>(request);
  }

  Future<Either<Exception, T>> put<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final request = dio.put(
      url,
      options: Options(headers: headers, validateStatus: (status) => true),
      data: data,
      queryParameters: queryParameters,
    );
    return _handleResponse<T>(request);
  }

  Future<Either<Exception, T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final request = dio.delete(
      url,
      options: Options(headers: headers, validateStatus: (status) => true),
      queryParameters: queryParameters,
    );
    return _handleResponse<T>(request);
  }

  Future<Either<Exception, T>> request<T>(
    String url, {
    String?
        method, // if request is not one of CRUD operations, give request type name here and use this function
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final request = dio.request(
      url,
      options: Options(
        method: method,
        headers: headers,
        validateStatus: (status) => true,
      ),
      data: data,
      queryParameters: queryParameters,
    );
    return _handleResponse<T>(request);
  }
}
