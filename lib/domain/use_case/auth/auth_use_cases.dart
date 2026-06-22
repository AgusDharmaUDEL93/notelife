import 'package:notelife/domain/use_case/auth/change_password_use_case.dart';
import 'package:notelife/domain/use_case/auth/forgot_password_use_case.dart';

import 'login_use_cases.dart';
import 'register_use_case.dart';

import 'is_logged_in_use_case.dart';
import 'logout_use_cases.dart';

class AuthUseCases {
  final RegisterUseCase registerUseCase;
  final LoginUseCases loginUseCases;
  final LogoutUseCases logoutUseCase;
  final IsLoggedInUseCase isLoggedInUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthUseCases({
    required this.registerUseCase,
    required this.loginUseCases,
    required this.logoutUseCase,
    required this.isLoggedInUseCase,
    required this.changePasswordUseCase,
    required this.forgotPasswordUseCase,
  });
}
