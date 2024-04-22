import 'package:dartz/dartz.dart';
import 'package:flutter_test_ui/feature/auth/domain/repository/server_url_repo.dart';

class ServerUrlRepoImpl implements ServerUrlRepo {
  @override
  Future<Either<Exception, String>> getServerUrl() async {
    try {
      // TODO: GetServerUrl logic here
      return const Right('https://www.google.com');
    } catch (e) {
      return Left(Exception('GetServerUrl Error'));
    }
  }
}
