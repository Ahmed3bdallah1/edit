import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../services/models/api_constants.dart';

class GetAllJobsFunction{
  Constants constants = Constants();

  Future<List<Map<String, dynamic>>> getAllJobs() async {
    var response = await http.get(
      Uri.parse(constants.getAllJobs),
      headers: {'Authorization': 'Bearer $generalToken'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);
      var dataList = data['data'];
      return List<Map<String, dynamic>>.from(dataList);
    } else {
      throw Exception(response.statusCode);
    }
  }

}