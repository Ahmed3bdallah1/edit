import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/jobs/jobs_model.dart';
import '../../managers/managers.dart';
import '../../remote/api_constants.dart';
import 'jobs_state.dart';
import 'package:http/http.dart' as http;

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  static JobsCubit get(BuildContext context) => BlocProvider.of(context);
  ApiConstants constants = ApiConstants();
  JobsModel? model;

  Future<List<Map<String, dynamic>>?> getAllJobs() async {
    final response = await http.get(
      Uri.parse(constants.getAllJobs),
      headers: {'Authorization': 'Bearer $generalToken'},
    );

    if (response.statusCode == 200) {
      print("success");
      var data = json.decode(response.body);
      model = JobsModel.fromJson(data);
      var listData = data["data"];
      emit(DoneJobsState(model!));
      return List<Map<String, dynamic>>.from(listData);
    } else {
      print("error");
      emit(ErrorJobsState());
      throw Exception("error");
    }
  }
}
