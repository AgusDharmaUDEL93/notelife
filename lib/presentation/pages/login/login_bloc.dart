import 'package:bloc/bloc.dart';
import 'package:notelife/domain/use_case/auth/auth_use_cases.dart';
import 'package:notelife/presentation/pages/login/login_event.dart';
import 'package:notelife/presentation/pages/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCases _authUseCases;

  LoginBloc(this._authUseCases) : super(LoginState()) {
    on<OnTogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<OnLoginButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = await _authUseCases.loginUseCases.execute(
        email: event.email,
        password: event.password,
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
