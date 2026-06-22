import 'package:bloc/bloc.dart';
import 'package:notelife/presentation/pages/pomodoro/pomodoro_event.dart';

import 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  PomodoroBloc() : super(PomodoroState());
}
