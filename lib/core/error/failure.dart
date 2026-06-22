import 'error_type.dart';

class Failure {
  final String message;
  final ErrorType? errorType;

  Failure(this.message, {this.errorType});
}
