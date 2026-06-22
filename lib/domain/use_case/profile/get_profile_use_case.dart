import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/data/source/remote/dto/profile_supabase_response_dto.dart';
import 'package:notelife/domain/model/profile.dart';
import 'package:notelife/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  Future<Either<Failure, Profile>> execute() async {
    var result = await _profileRepository.getProfile();

    return result.fold(
      (failure) => Left(failure),
      (success) => Right(success.toDomain()),
    );
  }
}
