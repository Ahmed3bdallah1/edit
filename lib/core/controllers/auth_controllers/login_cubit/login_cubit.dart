import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/login/login_model.dart';
import 'package:http/http.dart' as http;
import '../../../local/shared_preferences.dart';
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import '../../profile_controllers/profile_cubit/profile_cubit.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LogInState> {
  LoginCubit() : super(InitialStateSignIn());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  ApiConstants constants = ApiConstants();
  LoginModel? model;

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
      model = LoginModel.fromJson(jsonResponse);

      String token = jsonResponse['token'];
      CacheHelper.saveData(key: "token", value: token).then((value) {
        generalToken = token;
      });
      ProfileCubit.get(context).profileApi();
      emit(DoneStateSignIn(model: model!));
    } else {
      print("Sign in failed!");
      debugPrint(response.body);
      emit(ErrorStateSignIn(response.body));
    }
  }
}
