import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../services/models/api_constants.dart';

class ProfileScreenFuction{

  Constants constants = Constants();
  get getGeneralName => generalName;

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
      generalName = name;
      generalEmail = email;
      generalID = id;
      print(generalName);
    } else {
      print(response.statusCode);
    }
  }

}