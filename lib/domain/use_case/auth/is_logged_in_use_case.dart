import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';

import '../../repository/auth_repository.dart';

class IsLoggedInUseCase {
  final AuthRepository _authRepository;

  IsLoggedInUseCase(this._authRepository);

  Future<Either<Failure, bool>> execute() async {
    return await _authRepository.isLoggedIn();
  }
}
