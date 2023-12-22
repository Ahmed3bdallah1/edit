import 'package:graduation_project/models/register/register_model.dart';

abstract class RegisterState {}

class InitialStateRegister extends RegisterState {}

class DoneStateRegister extends RegisterState {
  final RegisterModel model;

  DoneStateRegister(this.model);
}

class ErrorStateRegister extends RegisterState {
  String error;

  ErrorStateRegister(this.error);
}
