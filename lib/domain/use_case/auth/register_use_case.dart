import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _authRepository.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
