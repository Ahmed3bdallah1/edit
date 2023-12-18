import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../common/managers.dart';
import '../../../common/utils/dialogs/show_dialog.dart';
import '../../remote/api_constants.dart';
import 'job_selection_screen.dart';

class RegisterFunction{
  ApiConstants constants = ApiConstants();


  Future<void> register(BuildContext context, String email, String username,
      String password) async {
    var response = await http.post(
      Uri.parse(constants.registerUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "name": username,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      String token = jsonResponse['token'];

      generalToken = token;
      print(response.body);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const JobSelectionScreen()));
    } else {
      showCustomDialog(context, "FAILED", response.body);
    }
  }

}