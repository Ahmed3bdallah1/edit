import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../managers/utils/dialogs/show_dialog.dart';
import '../../../managers/utils/dialogs/snak_bar.dart';
import '../../../remote/api_constants.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  ApiConstants constants = ApiConstants();

  Future<void> changePassword(String password, BuildContext context) async {
    var response = await http.put(Uri.parse(constants.changePassword),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({"password": password}));
    if (response.statusCode == 200) {
      showSnakBar(context, "edited successfully");
      print(response.body);
      emit(DoneChangeState());
    } else {
      showCustomDialog(context, "failed to edit", response.body);
      print(response.body);
      emit(ErrorChangeState());
    }
  }
}
