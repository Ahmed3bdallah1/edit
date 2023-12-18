import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../common/utils/dialogs/snak_bar.dart';
import '../../../../services/remote/api_constants.dart';

class EditProfileFunction{
  ApiConstants constants = ApiConstants();

  void editProfileData(BuildContext context,
      {required String bio,
        required String address,
        required String mobile}) async {
    var response = await http.put(Uri.parse(constants.editProfileUrl),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({
          "bio": bio,
          "address": address,
          "mobile": mobile,
        }));

    if (response.statusCode == 200) {
      showSnakBar(context, "profile edited successfully");
      // Navigator.pop(context);
    } else {
      showSnakBar(context, response.body);
    }
  }

}