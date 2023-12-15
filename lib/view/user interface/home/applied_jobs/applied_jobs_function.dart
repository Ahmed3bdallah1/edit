import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../services/remote/api_constants.dart';

class AppliedJobsFunction{
  Constants constants = Constants();

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
      return List<Map<String, dynamic>>.from(dataList);
    } else {
      throw Exception(response.statusCode);
    }
  }



}