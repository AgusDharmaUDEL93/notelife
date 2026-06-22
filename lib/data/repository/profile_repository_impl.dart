import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';
import 'package:notelife/data/source/remote/dto/profile_supabase_response_dto.dart';
import 'package:notelife/data/source/remote/profile_provider.dart';
import 'package:notelife/domain/repository/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileProvider _profileProvider;

  ProfileRepositoryImpl(this._profileProvider);

  @override
  Future<Either<Failure, bool>> changeProfileName(String name) async {
    try {
      await _profileProvider.changeProfileName(name: name);
      return Right(true);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileSupabaseResponseDto>> getProfile() async {
    try {
      var result = await _profileProvider.getProfile();
      return Right(result);
    } catch (e) {
      if (e is AuthApiException) {
        return Left(Failure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }
}
