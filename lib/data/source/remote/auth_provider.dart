import 'package:notelife/data/source/remote/dto/name_supabase_request_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider {
  final Supabase _supabase;

  AuthProvider(this._supabase);

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.client.auth.signUp(
        email: email,
        password: password,
        data: NameSupabaseRequestDto(name: name).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      await _supabase.client.auth.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    final session = _supabase.client.auth.currentSession;
    return session != null;
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final supabase = _supabase.client;

      final user = supabase.auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      final email = user.email;
      if (email == null) throw Exception("Email not found");

      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: oldPassword,
      );

      if (response.user == null) {
        throw Exception("Old password incorrect");
      }

      await supabase.auth.updateUser(UserAttributes(password: newPassword));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      final supabase = _supabase.client;
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      rethrow;
    }
  }
}
