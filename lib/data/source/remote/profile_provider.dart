import 'package:notelife/data/source/remote/dto/name_supabase_request_dto.dart';
import 'package:notelife/data/source/remote/dto/profile_supabase_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileProvider {
  final Supabase _supabase;

  ProfileProvider(this._supabase);

  Future<ProfileSupabaseResponseDto> getProfile() async {
    try {
      final session = _supabase.client.auth.currentSession;

      if (session == null) {
        throw Exception();
      }

      final user = session.user;

      return ProfileSupabaseResponseDto.fromJson({
        'uid': user.id,
        'email': user.email ?? '',
        'name': user.userMetadata?['name'] ?? '',
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeProfileName({required String name}) async {
    try {
      final session = _supabase.client.auth.currentSession;

      if (session == null) {
        throw AuthApiException('No active session found', statusCode: '400');
      }

      await _supabase.client.auth.updateUser(
        UserAttributes(data: NameSupabaseRequestDto(name: name).toJson()),
      );
    } catch (e) {
      rethrow;
    }
  }
}
