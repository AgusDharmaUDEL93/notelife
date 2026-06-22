import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/auth_repository.dart';

class LogoutUseCases {
  final AuthRepository _authRepository;

  LogoutUseCases(this._authRepository);

  Future<Either<Failure, bool>> execute() async {
    return await _authRepository.logout();
  }
}
