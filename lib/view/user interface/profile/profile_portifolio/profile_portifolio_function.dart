import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../common/utils/dialogs/snak_bar.dart';
import '../../../../services/remote/api_constants.dart';

class ProfilePortfolioFunction {
  ApiConstants constants = ApiConstants();

  Future<void> postCv(BuildContext context, String file, String image) async {
    var response = await http.post(Uri.parse(constants.portifolioUrl),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({"cv_file": file, "image": image}));
    if (response.statusCode == 200) {
      showSnakBar(context, "filed has been added");
      print(response.statusCode);
    } else {
      showSnakBar(context, response.body);
      print(response.statusCode);
    }
  }

  Future<List<Map<String, dynamic>>> getCVs() async {
    var response = await http.get(Uri.parse(constants.portifolioUrl),
        headers: {'Authorization': 'Bearer $generalToken'});

    if (response.statusCode == 200) {
      var xresponse = json.decode(response.body);
      print(xresponse);
      var portflioData = xresponse["data"]["portfolio"];
      print(portflioData);
      return List<Map<String, dynamic>>.from(portflioData);
    } else {
      return [];
    }
  }
}
