abstract class RegisterEvent {}

class OnTogglePasswordVisibility extends RegisterEvent {}

class OnToggleConfirmPasswordVisibility extends RegisterEvent {}

class ClearErrorState extends RegisterEvent {}

class OnRegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  OnRegisterButtonPressed({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
