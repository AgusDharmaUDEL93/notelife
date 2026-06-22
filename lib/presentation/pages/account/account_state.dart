import 'package:notelife/domain/model/profile.dart';

class AccountState {
  bool isLoading;
  bool isSuccessLogout;
  String? errorMessage;
  Profile? profile;

  AccountState({
    this.isLoading = false,
    this.isSuccessLogout = false,
    this.errorMessage,
    this.profile,
  });

  AccountState copyWith({
    bool? isLoading,
    bool? isSuccessLogout,
    String? errorMessage,
    Profile? profile,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      isSuccessLogout: isSuccessLogout ?? this.isSuccessLogout,
      errorMessage: errorMessage ?? this.errorMessage,
      profile: profile ?? this.profile,
    );
  }
}
