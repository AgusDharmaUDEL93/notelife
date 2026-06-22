import 'package:bloc/bloc.dart';
import 'package:notelife/domain/use_case/auth/auth_use_cases.dart';
import 'package:notelife/domain/use_case/profile/profile_use_cases.dart';

import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final ProfileUseCases _profileUseCases;
  final AuthUseCases _authUseCases;

  AccountBloc(this._profileUseCases, this._authUseCases)
    : super(AccountState()) {
    on<OnGetProfileData>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      var result = await _profileUseCases.getProfileUseCase.execute();

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(isLoading: false, profile: success));
        },
      );
    });

    on<OnLogoutAccount>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      var result = await _authUseCases.logoutUseCase.execute();

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(isLoading: false, isSuccessLogout: success));
        },
      );
    });
  }
}
