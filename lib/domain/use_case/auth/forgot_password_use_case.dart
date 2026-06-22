import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _authRepository;

  ForgotPasswordUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({required String email}) async {
    return await _authRepository.forgotPassword(email: email);
  }
}
