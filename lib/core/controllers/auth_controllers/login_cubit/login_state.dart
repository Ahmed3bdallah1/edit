import 'package:graduation_project/models/login/login_model.dart';

abstract class LogInState {}

class InitialStateSignIn extends LogInState {}

class DoneStateSignIn extends LogInState {
  final LoginModel model;
  DoneStateSignIn({required this.model});
}

class ErrorStateSignIn extends LogInState {
  String error;

  ErrorStateSignIn(this.error);
}
