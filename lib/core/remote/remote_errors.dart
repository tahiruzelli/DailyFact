
import 'package:dio/dio.dart';



class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r, {err}) : super(requestOptions: r, response: err);

  @override
  String toString() {
    return response?.data['message'] ?? 'The connection has timed out, please try again.';
  }
}