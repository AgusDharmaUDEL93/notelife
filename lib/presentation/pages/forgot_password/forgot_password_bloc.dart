import 'package:bloc/bloc.dart';
import 'package:notelife/domain/use_case/auth/auth_use_cases.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_event.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthUseCases _authUseCases;

  ForgotPasswordBloc(this._authUseCases) : super(ForgotPasswordState()) {
    on<OnSendForgotPasswordConfirmation>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      var result = await _authUseCases.forgotPasswordUseCase.execute(
        email: event.email,
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
        },
      );
    });
  }
}
