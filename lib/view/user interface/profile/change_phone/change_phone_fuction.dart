import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/utils/dialogs/snak_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../services/remote/api_constants.dart';

class ChangePhoneFunction{
  ApiConstants constants = ApiConstants();

  void editMobile(BuildContext context, {required String mobile}) async {
    var response = await http.put(Uri.parse(constants.editProfileUrl),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({
          "mobile": mobile,
        }));

    if (response.statusCode == 200) {
      showSnakBar(context, "phone changed successfully");
      print(response);
      Navigator.pop(context);
    } else {
      print('faild');
    }
  }

}