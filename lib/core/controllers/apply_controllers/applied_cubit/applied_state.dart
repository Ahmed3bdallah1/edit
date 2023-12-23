import 'package:graduation_project/models/applied_model/applied_model.dart';

abstract class AppliedState {}

class AppliedInitial extends AppliedState {}

class DoneAppliedState extends AppliedState {
  final AppliedModel model;

  DoneAppliedState(this.model);
}

class ErrorAppliedState extends AppliedState {}
