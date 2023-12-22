import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'applied_state.dart';

class AppliedCubit extends Cubit<AppliedState> {
  AppliedCubit() : super(AppliedInitial());

  static AppliedCubit get(BuildContext context) => BlocProvider.of(context);

  ApiConstants constants = ApiConstants();

  Future<List<Map<String, dynamic>>> appliedJobsApi() async {
    var response = await http.get(
      Uri.parse(constants.getAppliedJobs),
      headers: {
        'Authorization': 'Bearer $generalToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var dataList = data['data'];
      emit(DoneAppliedState());
      return List<Map<String, dynamic>>.from(dataList);
    } else {
      emit(ErrorAppliedState());
      throw Exception(response.statusCode);
    }
  }
}
