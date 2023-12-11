import 'package:daily/core/errors/failure/Failure.dart';

abstract class ServerFailure extends Failure{
  final int code;
  final String error;

  const ServerFailure(this.code, this.error) : super(error);
}