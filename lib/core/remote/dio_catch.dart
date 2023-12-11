import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioCatch {
  onError(DioException e) {
    if (e.response?.statusCode == 400) {
      try {
        String? error = e.response?.data;
        return Left(error);
      } catch (error) {
        return Left(e.response?.data['detail']);
      }
    } else if (e.response?.statusCode == 422) {
      return Left(e.response?.data['errors'].first);
    } else {
      try {
        return Left(
          e.response?.data['message'] ?? e.response?.statusMessage ?? "",
        );
      } catch (e) {
        return const Left("unknown error");
      }
    }
  }
}
