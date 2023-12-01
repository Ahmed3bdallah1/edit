import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../common/transition/page_route_transition.dart';
import '../../../view/user interface/home/bottom_navigation_bar_config.dart';
import '../../../view/user interface/profile/profile_screen/profile_screen_function.dart';
import '../../models/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../models/user_models/user_database.dart';

class LoginFunction{
  Constants constants = Constants();

  Future<void> login(
      BuildContext context, String email, String password) async {
    print("login");
    var response = await http.post(
      Uri.parse(constants.loginUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // String userName = jsonResponse['user'][
      //     'name']; // Assuming the user's name is under 'name' key in the JSON response

      String token = jsonResponse['token'];
      generalToken = token;
      print(generalToken);
      DbHelper.createUser(1, generalToken);
      ProfileScreenFuction().profileApi();
      Navigator.pushReplacement(
          context, customPageRouteTransition(const NavigationBarConfig()));
    } else {
      print("Sign in failed!");
      print(response.statusCode);
      print(response.body);
    }
  }

}