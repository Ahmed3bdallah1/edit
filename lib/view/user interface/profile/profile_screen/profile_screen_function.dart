import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../services/local/shared_preferences.dart';
import '../../../../services/remote/api_constants.dart';

class ProfileScreenFunction {
  ApiConstants constants = ApiConstants();

  Future<void> profileApi() async {
    var response = await http.get(
      Uri.parse(constants.profileUrl),
      headers: {'Authorization': 'Bearer $generalToken'},
    );
    if (response.statusCode == 200) {
      var xresponse = json.decode(response.body);
      print(xresponse);
      var name = xresponse["data"]["name"];
      var email = xresponse["data"]["email"];
      var id = xresponse["data"]["id"];
      CacheHelper.saveData(key: "name", value: name).then((value) {
        generalName = name;
      });
      CacheHelper.saveData(key: "email", value: email).then((value) {
        generalEmail = email;
      });
      CacheHelper.saveData(key: "id", value: id).then((value) {
        generalID = id;
      });
      print(generalName);
    } else {
      print(response.statusCode);
    }
  }
}
