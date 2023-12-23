import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/auth_controllers/register_cubit/register_state.dart';
import 'package:graduation_project/models/register/register_model.dart';
import 'package:http/http.dart' as http;
import '../../../managers/utils/dialogs/show_dialog.dart';
import '../../../remote/api_constants.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialStateRegister());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  ApiConstants constants = ApiConstants();
  RegisterModel? model;

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
      model = RegisterModel.fromJson(jsonResponse);
      debugPrint(jsonResponse);
      emit(DoneStateRegister(model!));
    } else {
      showCustomDialog(context, "FAILED", response.body);
      emit(ErrorStateRegister(response.statusCode.toString()));
    }
  }
}
