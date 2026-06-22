part of 'app_router.dart';

class Routes {
  static const splash = _Paths.splash;

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const forgotPassword = _Paths.forgotPassword;

  static const task = _Paths.task;
  static const link = _Paths.link;
  static const pomodoro = _Paths.pomodoro;

  static const account = _Paths.account;
}

class _Paths {
  _Paths._();

  static const splash = '/';

  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';

  static const task = '/app/task';
  static const link = '/app/link';
  static const pomodoro = '/app/pomodoro';

  static const account = '/account';
}
