abstract class ForgotPasswordEvent {}

class OnSendForgotPasswordConfirmation extends ForgotPasswordEvent {
  String email;

  OnSendForgotPasswordConfirmation({required this.email});
}
