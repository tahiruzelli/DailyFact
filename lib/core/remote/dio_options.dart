import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../build_configs/build_config_manager.dart';

@singleton
class DioOptions {
  final String baseUrl = config.host;
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
  final options = BaseOptions(
    baseUrl: config.host,
    connectTimeout: const Duration(milliseconds: connectTimeout),
    receiveTimeout: const Duration(milliseconds: receiveTimeout),
    sendTimeout: const Duration(milliseconds: sendTimeout),
    followRedirects: false,
  );
}
