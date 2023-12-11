import 'package:dio/dio.dart';
import 'package:daily/core/consts/consts.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/remote/remote_config.dart';

class DioRequest {
  Future<Response<dynamic>?> request(RequestType requestType, String url,
      {dynamic body}) async {
    // var refreshTokenResult = await JwtManager().checkAndRefreshToken();
    // if (!refreshTokenResult) {
    //   await Future.delayed(const Duration(seconds: 1));
    //   exit(0);
    // }
    switch (requestType) {
      case RequestType.get:
        var result = await locator<RemoteConfig>().dio?.get(url);
        // logger.setLog(
        //   "DATETIME: ${DateTime.now()}, REQUEST TYPE: $requestType, URL: $url, BODY:$body, RESPONSE: ${result?.data.toString() ?? "NO RESPONSE"}",
        // );
        return result;
      case RequestType.post:
        var result = await locator<RemoteConfig>().dio?.post(url, data: body);
        // logger.setLog(
        //   "DATETIME: ${DateTime.now()}, REQUEST TYPE: $requestType, URL: $url, BODY:$body, RESPONSE: ${result?.data.toString() ?? "NO RESPONSE"}",
        // );
        return result;
      case RequestType.patch:
        var result = await locator<RemoteConfig>().dio?.patch(url, data: body);
        // logger.setLog(
        //   "DATETIME: ${DateTime.now()}, REQUEST TYPE: $requestType, URL: $url, BODY:$body, RESPONSE: ${result?.data.toString() ?? "NO RESPONSE"}",
        // );
        return result;
      case RequestType.put:
        var result = await locator<RemoteConfig>().dio?.put(
              url,
              data: body == String ? "$body" : body,
            );
        // logger.setLog(
        //   "DATETIME: ${DateTime.now()}, REQUEST TYPE: $requestType, URL: $url, BODY:$body, RESPONSE: ${result?.data.toString() ?? "NO RESPONSE"}",
        // );
        return result;
      case RequestType.delete:
        var result = await locator<RemoteConfig>().dio?.delete(url);
        return result;
    }
  }
}
