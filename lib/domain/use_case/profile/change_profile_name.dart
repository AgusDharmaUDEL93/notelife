import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/domain/repository/profile_repository.dart';

class ChangeProfileName {
  final ProfileRepository _profileRepository;

  ChangeProfileName(this._profileRepository);

  Future<Either<Failure, bool>> execute({required String name}) async {
    return await _profileRepository.changeProfileName(name);
  }
}
