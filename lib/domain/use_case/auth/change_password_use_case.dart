import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/domain/repository/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await _authRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
