import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, bool>> isLoggedIn();

  Future<Either<Failure, bool>> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<Either<Failure, bool>> forgotPassword({required String email});
}
