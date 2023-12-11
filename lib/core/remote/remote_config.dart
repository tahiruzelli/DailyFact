
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/remote/dio_options.dart';
import 'package:daily/core/remote/interceptors.dart';
@singleton
class RemoteConfig {

  DioOptions options = locator<DioOptions>();

  Dio? dio;

  RemoteConfig(){
    dio =  Dio(options.options);
    dio?.interceptors.add(locator<MyDioInterceptor>());
  }
}