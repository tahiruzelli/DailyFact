import 'package:daily/core/remote/response_model.dart';
import 'package:dartz/dartz.dart';

class ExtractEither {
  ResponseModel getLeft(Either<ResponseModel, dynamic> either) {
    late ResponseModel left;
    either.fold((l) => left = l, (r) => null);
    return left;
  }

  dynamic getRight(Either<dynamic, dynamic> either) {
    late dynamic right;
    either.fold((l) => null, (r) => right = r);
    return right;
  }

  String getResponseModelsMessage(Either<ResponseModel, dynamic> value) {
    try {
      ResponseModel? response;
      String? message;
      value.fold((l) => response = l, (r) => null);
      message = response?.message;
      return message ?? '';
    } catch (e) {
      return '';
    }
  }
}
