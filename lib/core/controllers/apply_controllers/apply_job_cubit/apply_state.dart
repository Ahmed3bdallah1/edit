abstract class ApplyState {}

class ApplyInitial extends ApplyState {}

class DoneApplyState extends ApplyState {}

class ErrorApplyState extends ApplyState {
  final String error;

  ErrorApplyState(this.error);
}
