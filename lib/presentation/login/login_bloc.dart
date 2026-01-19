import 'package:bloc/bloc.dart';
import 'package:notelife/presentation/login/login_event.dart';
import 'package:notelife/presentation/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());
}
