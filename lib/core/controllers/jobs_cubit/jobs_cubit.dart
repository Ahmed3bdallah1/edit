import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/jobs/jobs_model.dart';
import 'package:http/http.dart' as http;

import '../../managers/managers.dart';
import '../../remote/api_constants.dart';
import 'jobs_state.dart';

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

    try {
      if (response.statusCode == 200) {
        print("success y 3lek");
        var data = json.decode(response.body);
        print(data);
        print(response.body.length);
        model = JobsModel.fromJson(data);
        var listData = data["data"];
        emit(DoneJobsState(model!));
        return List<Map<String, dynamic>>.from(listData);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> searchJobs(String query) async {
    if (query.isEmpty) {
      return getAllJobs();
    } else {
      final allJobs = await getAllJobs();
      return allJobs?.where((job) {
        final name = job["name"].toString().toLowerCase();
        final company = job["company"].toString().toLowerCase();
        return name.contains(query.toLowerCase()) ||
            company.contains(query.toLowerCase());
      }).toList();
    }
  }
}
