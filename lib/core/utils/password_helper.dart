import 'package:dartz/dartz.dart';

class PasswordHelper {
  Either<String, bool> checkPasswordFormat(String password) {
    if (password.length < 8) {
      return const Left("Şifreniz 8 karakterden az olamaz");
    } else if (!_isStringContainsNumber(password)) {
      return const Left("Şifreniz sayı içermeli");
    } else if (!_isStringContainsLowerCase(password)) {
      return const Left("Şifreniz küçük harf içermeli");
    } else if (!_isStringContainsUpperCase(password)) {
      return const Left("Şifreniz büyük harf içermeli");
    } else if (!_isStringContainsSpecialChar(password)) {
      return const Left("Şifreniz özel karakter içermeli");
    } else {
      return const Right(true);
    }
  }

  bool _isStringContainsNumber(String string) {
    return string.contains(RegExp(r'[0-9]'));
  }

  bool _isStringContainsUpperCase(String string) {
    return string.contains(RegExp(r'[A-Z]'));
  }

  bool _isStringContainsLowerCase(String string) {
    return string.contains(RegExp(r'[a-z]'));
  }

  bool _isStringContainsSpecialChar(String string) {
    return string.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
