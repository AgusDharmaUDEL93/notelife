import 'package:get_it/get_it.dart';
import 'package:notelife/data/repository/profile_repository_impl.dart';
import 'package:notelife/data/source/remote/auth_provider.dart';
import 'package:notelife/data/source/remote/profile_provider.dart';
import 'package:notelife/domain/repository/auth_repository.dart';
import 'package:notelife/domain/repository/profile_repository.dart';
import 'package:notelife/domain/use_case/auth/change_password_use_case.dart';
import 'package:notelife/domain/use_case/auth/forgot_password_use_case.dart';
import 'package:notelife/domain/use_case/auth/register_use_case.dart';
import 'package:notelife/domain/use_case/profile/change_profile_name.dart';
import 'package:notelife/domain/use_case/profile/get_profile_use_case.dart';
import 'package:notelife/domain/use_case/profile/profile_use_cases.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_bloc.dart';
import 'package:notelife/presentation/pages/link/link_bloc.dart';
import 'package:notelife/presentation/pages/pomodoro/pomodoro_bloc.dart';
import 'package:notelife/presentation/pages/register/register_bloc.dart';
import 'package:notelife/presentation/pages/task/task_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repository/auth_repository_impl.dart';
import '../domain/use_case/auth/auth_use_cases.dart';
import '../domain/use_case/auth/is_logged_in_use_case.dart';
import '../domain/use_case/auth/login_use_cases.dart';
import '../domain/use_case/auth/logout_use_cases.dart';
import '../presentation/pages/account/account_bloc.dart';
import '../presentation/pages/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> injection() async {
  sl.registerFactory<Supabase>(() => Supabase.instance);

  sl.registerFactory<AuthProvider>(() => AuthProvider(sl()));
  sl.registerFactory<ProfileProvider>(() => ProfileProvider(sl()));

  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory<ProfileRepository>(() => ProfileRepositoryImpl(sl()));

  sl.registerFactory<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerFactory<LoginUseCases>(() => LoginUseCases(sl()));
  sl.registerFactory<LogoutUseCases>(() => LogoutUseCases(sl()));
  sl.registerFactory<IsLoggedInUseCase>(() => IsLoggedInUseCase(sl()));
  sl.registerFactory<ChangePasswordUseCase>(() => ChangePasswordUseCase(sl()));
  sl.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(sl()));
  sl.registerFactory(
    () => AuthUseCases(
      registerUseCase: sl(),
      loginUseCases: sl(),
      logoutUseCase: sl(),
      isLoggedInUseCase: sl(),
      changePasswordUseCase: sl(),
      forgotPasswordUseCase: sl(),
    ),
  );

  sl.registerFactory<GetProfileUseCase>(() => GetProfileUseCase(sl()));
  sl.registerFactory<ChangeProfileName>(() => ChangeProfileName(sl()));
  sl.registerFactory<ProfileUseCases>(
    () => ProfileUseCases(changeProfileName: sl(), getProfileUseCase: sl()),
  );

  sl.registerFactory<AccountBloc>(() => AccountBloc(sl(), sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<TaskBloc>(() => TaskBloc());
  sl.registerFactory<LinkBloc>(() => LinkBloc());
  sl.registerFactory<PomodoroBloc>(() => PomodoroBloc());
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(sl()));
}
