import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/utils/dialogs/snak_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../common/utils/dialogs/show_dialog.dart';
import '../../../../services/models/api_constants.dart';

class ChangePasswordFunction{
  Constants constants = Constants();


  Future<void> changePassword(String password,BuildContext context) async {
    var response = await http.put(Uri.parse(constants.changePassword),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({"password": password}));
    if (response.statusCode == 200) {
      showSnakBar(context, "edited successfully");
      print(response.body);
      // Navigator.pop(context);
    } else {
      showCustomDialog(context, "failed to edit", response.body);
      print(response.body);
    }
  }

}