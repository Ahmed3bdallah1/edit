import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../common/managers.dart';
import '../../../common/transition/page_route_transition.dart';
import '../../../view/user interface/home/bottom_navigation_bar_config.dart';
import '../../../view/user interface/profile/profile_screen/profile_screen_function.dart';
import '../../local/shared_preferences.dart';
import '../../remote/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginFunction {
  ApiConstants constants = ApiConstants();

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

      String token = jsonResponse['token'];
      CacheHelper.saveData(key: "token", value: token).then((value) {
        generalToken = token;
      });
      ProfileScreenFunction().profileApi();
      Navigator.pushReplacement(
          context, customPageRouteTransition(const NavigationBarConfig()));
    } else {
      print("Sign in failed!");
      print(response.body);
    }
  }
}
