import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/applied_model/applied_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'applied_state.dart';

class AppliedCubit extends Cubit<AppliedState> {
  AppliedCubit() : super(AppliedInitial());

  static AppliedCubit get(BuildContext context) => BlocProvider.of(context);
  AppliedModel? model;

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
      var responseData = json.decode(response.body);
      model = AppliedModel.fromJson(responseData);
      List<dynamic> dataList = responseData['data'];
      List<Map<String, dynamic>> mappedDataList = dataList.map((item) {
        return item as Map<String, dynamic>;
      }).toList();
      print(mappedDataList);
      emit(DoneAppliedState(model!));
      return mappedDataList;
    } else {
      emit(ErrorAppliedState());
      throw Exception(response.statusCode);
    }
  }
}
