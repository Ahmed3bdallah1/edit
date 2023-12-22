import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit() : super(ApplyInitial());
  static ApplyCubit get(BuildContext context) => BlocProvider.of(context);


  ApiConstants constants = ApiConstants();

  Future<void> applyToJobData(
      {required int jobId,
      required int userId,
      required String name,
      required String email,
      required String number,
      required String work,
      required String image,
      required String file}) async {
    var responce = await http.post(Uri.parse(constants.applyToJob), headers: {
      'Authorization': 'Bearer $generalToken'
    }, body: {
      "jobs_id": jobId,
      "user_id": userId,
      "name": name,
      "email": email,
      "mobile": number,
      "work_type": work,
      "cv_file": file,
      "other_file": image,
    });

    if (responce.statusCode == 200) {
      print(responce.statusCode);
      emit(DoneApplyState());
    } else {
      print(responce.statusCode);
      emit(ErrorApplyState(responce.body));
    }
  }
}
