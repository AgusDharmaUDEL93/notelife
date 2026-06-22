abstract class LoginEvent {}

class OnTogglePasswordVisibility extends LoginEvent {}

class OnLoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  OnLoginButtonPressed({required this.email, required this.password});
}
