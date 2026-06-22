import 'package:dartz/dartz.dart';
import 'package:notelife/core/error/failure.dart';

import '../../data/source/remote/dto/profile_supabase_response_dto.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileSupabaseResponseDto>> getProfile();
  Future<Either<Failure, bool>> changeProfileName(String name);
}
