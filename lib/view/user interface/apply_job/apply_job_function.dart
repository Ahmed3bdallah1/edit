import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../common/managers.dart';
import '../../../services/remote/api_constants.dart';

class ApplyJobFunction{
  Constants constants = Constants();

  Future<void> applyToJobData(
      {required int jobId,
        required int userId,
        required String name,
        required String email,
        required String number,
        required String work,
        required File image,
        required File file}) async {
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
    }else{
      print(responce.statusCode);
    }
  }
}