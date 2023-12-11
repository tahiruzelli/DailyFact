// import 'package:daily/core/consts/keys.dart';
// import 'package:daily/core/locator/service_locator.dart';
// import 'package:daily/core/shared_preferences/shared_preferences.dart';
// import 'package:daily/core/utils/extract_either.dart';

// class JwtManager {
//   bool _isTokenExpired() {
//     String? exp = prefs.getString(KeysNames.accessTokenExpDateKey);
//     if (exp == null) {
//       return false;
//     }
//     DateTime date = DateTime.parse(exp);
//     DateTime now = DateTime.now();

//     Duration timeZoneOffset = DateTime.now().timeZoneOffset;
//     date = date.add(timeZoneOffset);
//     int expDateInt = 0;
//     int currentTimeInt = 0;
//     expDateInt = (date.month * 438290639) +
//         (date.day * 1440) +
//         (date.hour * 60) +
//         (date.minute);
//     currentTimeInt = (now.month * 438290639) +
//         (now.day * 1440) +
//         (now.hour * 60) +
//         (now.minute);
//     return expDateInt - currentTimeInt < 2;
//   }

//   // Future<bool> _refreshToken() async {
//   //   final SplashLogicHolder logicHolder = locator<SplashLogicHolder>();
//   //   var result = await logicHolder.refreshToken();
//   //   if (result.isLeft()) {
//   //     var resultString = ExtractEither().getLeft(result);
//   //     if (resultString == "Refresh token parametresini kontrol ediniz.") {
//   //       return false;
//   //     }
//   //   }
//   //   return true;
//   // }

//   Future<bool> checkAndRefreshToken() async {
//     if (_isTokenExpired()) {
//       return _refreshToken();
//     }
//     return true;
//   }
// }
