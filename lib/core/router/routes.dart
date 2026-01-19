part of 'app_router.dart';

class Routes {
  static const splash = _Paths.splash;

  static const login = _Paths.login;

  static const task = _Paths.task;
  static const link = _Paths.link;
  static const pomodoro = _Paths.pomodoro;
}

class _Paths {
  _Paths._();

  static const splash = '/';

  static const login = '/login';

  static const task = '/app/task';
  static const link = '/app/link';
  static const pomodoro = '/app/pomodoro';
}
