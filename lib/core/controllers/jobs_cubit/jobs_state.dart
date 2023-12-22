import 'package:graduation_project/models/jobs/jobs_model.dart';

abstract class JobsState {}

class JobsInitial extends JobsState {}

class DoneJobsState extends JobsState {
  final JobsModel model;

  DoneJobsState(this.model);
}

class ErrorJobsState extends JobsState {}
