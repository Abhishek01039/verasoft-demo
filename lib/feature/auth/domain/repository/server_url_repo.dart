import 'package:dartz/dartz.dart';

abstract class ServerUrlRepo {
  Future<Either<Exception, String>> getServerUrl();
}
