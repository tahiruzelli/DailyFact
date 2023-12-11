import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../logger/logger.dart';

@singleton
class MyDioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logPrint("DIO-ERROR: ${err.type.name}: ${err.message}");
    logPrint("DIO-ERROR-RESPONSE: ${err.response}");
    // switch (err.type) {
    //   case DioErrorType.connectTimeout:
    //   case DioErrorType.sendTimeout:
    //   case DioErrorType.receiveTimeout:
    //     throw DeadlineExceededException(err.requestOptions, err: err.response);
    //   case DioErrorType.response:
    //     switch (err.response?.statusCode) {
    //       case 400:
    //         throw BadRequestException(err.requestOptions, err:  err);
    //       case 401:
    //         throw UnauthorizedException(err.requestOptions, err:  err.response);
    //       case 404:
    //         throw NotFoundException(err.requestOptions, err:  err.response);
    //       case 409:
    //         throw ConflictException(err.requestOptions, err:  err.response);
    //       case 500:
    //         throw InternalServerErrorException(err.requestOptions, err:  err.response);
    //     }
    //     break;
    //   case DioErrorType.cancel:
    //     break;
    //   case DioErrorType.other:
    //     throw NoInternetConnectionException(err.requestOptions, err:  err.response);
    // }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint("DIO-REQUEST: ${options.uri}");
    logPrint("DIO-BODY: ${options.data}");
    logPrint("DIO-HEADERS: ${options.headers}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint('DIO-RESPONSE: ${response.realUri}');
    logPrint('DIO-RESPONSE: ${response.statusCode}');
    logPrint('DIO-RESPONSE: ${response.statusMessage}');
    logPrint('DIO-RESPONSE: ${response.data}');
    handler.next(response);
  }
}
