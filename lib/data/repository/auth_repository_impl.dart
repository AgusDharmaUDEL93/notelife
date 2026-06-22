import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/data/source/remote/auth_provider.dart';
import 'package:notelife/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider _authProvider;

  AuthRepositoryImpl(this._authProvider);

  @override
  Future<Either<Failure, bool>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _authProvider.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(true);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await _authProvider.isLoggedIn();
      return Right(result);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authProvider.login(email: email, password: password);
      return Right(true);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await _authProvider.logout();
      return Right(result);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _authProvider.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return Right(true);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword({required String email}) async {
    try {
      await _authProvider.forgotPassword(email: email);
      return Right(true);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }
}
