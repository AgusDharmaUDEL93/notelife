import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notelife/di/injection.dart';
import 'package:notelife/presentation/link/link_bloc.dart';
import 'package:notelife/presentation/link/link_view.dart';
import 'package:notelife/presentation/login/login_bloc.dart';
import 'package:notelife/presentation/login/login_view.dart';
import 'package:notelife/presentation/pomodoro/pomodoro_bloc.dart';
import 'package:notelife/presentation/pomodoro/pomodoro_view.dart';
import 'package:notelife/presentation/task/task_view.dart';
import 'package:notelife/presentation/wrapper/wrapper_view.dart';

import '../../presentation/splash/splash_view.dart';
import '../../presentation/task/task_bloc.dart';

part 'routes.dart';

class AppRouter {
  GoRouter get router => GoRouter(
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
      ShellRoute(
        builder: (context, state, child) => WrapperView(child: child),
        redirect: (context, state) {
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
