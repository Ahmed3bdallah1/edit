import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/utils/dialogs/snak_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../common/managers.dart';
import '../../../../common/utils/dialogs/show_dialog.dart';
import '../../../../services/remote/api_constants.dart';

class EditEmailFunction {
  ApiConstants constants = ApiConstants();

  Future<void> editEmail(BuildContext context, String email) async {
    var response = await http.post(
      Uri.parse(constants.editEmail),
      headers: {
        'Authorization': 'Bearer $generalToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context);
      showSnakBar(context, "edited successfully");
      print("done");
    } else {
      showCustomDialog(context, "failed to edit", response.body);
      print(response.statusCode);
    }
  }
}
