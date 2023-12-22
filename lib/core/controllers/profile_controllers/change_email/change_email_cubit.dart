import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'change_email_state.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangeEmailCubit extends Cubit<ChangeEmailState> {
  ChangeEmailCubit() : super(ChangeEmailInitial());

  static ChangeEmailCubit get(BuildContext context) => BlocProvider.of(context);

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
      print("done");
      emit(DoneChangeEmailState());
    } else {
      print(response.statusCode);
      emit(ErrorChangeEmailState());
    }
  }
}
