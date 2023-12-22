import 'package:graduation_project/models/profile/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class DoneStateProfile extends ProfileState {
  final ProfileModel model;

  DoneStateProfile(this.model);
}

class ErrorStateProfile extends ProfileState {
  final String error;

  ErrorStateProfile(this.error);
}
