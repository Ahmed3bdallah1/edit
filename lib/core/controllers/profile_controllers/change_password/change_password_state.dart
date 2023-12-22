abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class DoneChangeState extends ChangePasswordState {}

class ErrorChangeState extends ChangePasswordState {}
