import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/auth_repository.dart';

class LoginUseCases {
  final AuthRepository _authRepository;

  LoginUseCases(this._authRepository);

  Future<Either<Failure, bool>> execute({
    required String email,
    required String password,
  }) async {
    return await _authRepository.login(email: email, password: password);
  }
}
