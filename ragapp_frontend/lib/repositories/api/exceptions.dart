import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException({required this.message});
  final String? message;

  @override
  String toString() => message ?? 'unknown error';
}

class BadRequestException extends ApiException {
  BadRequestException({super.message});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({super.message});
}

class ForbiddenException extends ApiException {
  ForbiddenException({super.message});
}

class NotFoundException extends ApiException {
  NotFoundException({super.message});
}

class ConflictException extends ApiException {
  ConflictException({super.message});
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({super.message});
}

class BadGatewayException extends ApiException {
  BadGatewayException({super.message});
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({super.message});
}

class ApiErrorHandler {
  static Exception handleError(error) {
    // I usually use Dio package for networking. If you use Http, you have to change here to HttpError
    if (error is DioException) {
      final e = error.response;
      switch (e?.statusCode) {
        case 400:
          return BadRequestException(message: e?.data.toString());
        case 401:
          return UnauthorizedException(message: e?.data.toString());
        case 403:
          return ForbiddenException(message: e?.data.toString());
        case 404:
          return NotFoundException(message: e?.data.toString());
        case 409:
          return ConflictException(message: e?.data.toString());
        case 500:
          return InternalServerErrorException(message: e?.data.toString());
        case 502:
          return BadGatewayException(message: e?.data.toString());
        case 503:
          return ServiceUnavailableException(message: e?.data.toString());
        default:
          return ApiException(message: e?.data.toString());
      }
    } else {
      return ApiException(message: error.toString());
    }
  }
}
