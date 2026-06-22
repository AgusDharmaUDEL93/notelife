import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/di/injection.dart';
import 'package:notelife/presentation/pages/account/account_bloc.dart';
import 'package:notelife/presentation/pages/account/account_view.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_bloc.dart';
import 'package:notelife/presentation/pages/forgot_password/forgot_password_view.dart';
import 'package:notelife/presentation/pages/link/link_bloc.dart';
import 'package:notelife/presentation/pages/link/link_view.dart';
import 'package:notelife/presentation/pages/login/login_bloc.dart';
import 'package:notelife/presentation/pages/login/login_view.dart';
import 'package:notelife/presentation/pages/pomodoro/pomodoro_bloc.dart';
import 'package:notelife/presentation/pages/pomodoro/pomodoro_view.dart';
import 'package:notelife/presentation/pages/register/register_bloc.dart';
import 'package:notelife/presentation/pages/task/task_view.dart';
import 'package:notelife/presentation/pages/wrapper/wrapper_view.dart';

import '../../domain/use_case/auth/auth_use_cases.dart';
import '../../presentation/pages/register/register_view.dart';
import '../../presentation/pages/splash/splash_view.dart';
import '../../presentation/pages/task/task_bloc.dart';

part 'routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => SplashView()),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginBloc>(),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<RegisterBloc>(),
          child: RegisterView(),
        ),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ForgotPasswordBloc>(),
          child: ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: Routes.account,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AccountBloc>(),
          child: AccountView(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => WrapperView(child: child),
        redirect: (context, state) async {
          final authUseCases = sl<AuthUseCases>();

          var isLoggedIn = await authUseCases.isLoggedInUseCase.execute().then((
            result,
          ) {
            return result.fold((failure) => false, (isLoggedIn) => isLoggedIn);
          });

          if (isLoggedIn) {
            return null;
          }

          return Routes.login;
        },
        routes: [
          GoRoute(
            path: Routes.task,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (context) => sl<TaskBloc>(),
                child: TaskView(),
              ),
            ),
          ),
          GoRoute(
            path: Routes.link,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (context) => sl<LinkBloc>(),
                child: LinkView(),
              ),
            ),
          ),
          GoRoute(
            path: Routes.pomodoro,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (context) => sl<PomodoroBloc>(),
                child: PomodoroView(),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
