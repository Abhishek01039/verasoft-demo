import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Exception, bool>> signIn({
    required String username,
    required String password,
  });
}
