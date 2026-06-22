import 'package:bloc/bloc.dart';
import 'package:notelife/domain/use_case/auth/auth_use_cases.dart';
import 'package:notelife/presentation/pages/register/register_event.dart';
import 'package:notelife/presentation/pages/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthUseCases _authUseCases;

  RegisterBloc(this._authUseCases) : super(RegisterState()) {
    on<OnTogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<OnToggleConfirmPasswordVisibility>((event, emit) {
      emit(
        state.copyWith(
          isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
        ),
      );
    });

    on<OnRegisterButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = await _authUseCases.registerUseCase.execute(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      result.fold(
        (failure) {
          print("On Error");
          emit(state.copyWith(isLoading: false, errorMessage: failure.message));
        },
        (success) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
        },
      );
    });
  }
}
