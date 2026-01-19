import 'package:get_it/get_it.dart';
import 'package:notelife/presentation/link/link_bloc.dart';
import 'package:notelife/presentation/pomodoro/pomodoro_bloc.dart';
import 'package:notelife/presentation/task/task_bloc.dart';

import '../presentation/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> injection() async {
  sl.registerFactory<LoginBloc>(() => LoginBloc());
  sl.registerFactory<TaskBloc>(() => TaskBloc());
  sl.registerFactory<LinkBloc>(() => LinkBloc());
  sl.registerFactory<PomodoroBloc>(() => PomodoroBloc());
}
