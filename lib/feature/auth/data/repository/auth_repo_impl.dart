import 'package:dartz/dartz.dart';
import 'package:flutter_test_ui/feature/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Exception, bool>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      // TODO: SignIn logic here
      return const Right(true);
    } catch (e) {
      return Left(Exception('SignIn Error'));
    }
  }
}
