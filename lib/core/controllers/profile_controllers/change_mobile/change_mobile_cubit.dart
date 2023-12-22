import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../managers/utils/dialogs/snak_bar.dart';
import '../../../remote/api_constants.dart';
import 'change_mobile_state.dart';

class ChangeMobileCubit extends Cubit<ChangeMobileState> {
  ChangeMobileCubit() : super(ChangeMobileInitial());

  static ChangeMobileCubit get(BuildContext context) =>
      BlocProvider.of(context);

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
      emit(DoneChangeMobileState());
    } else {
      print('faild');
      emit(ErrorChangeMobileState());
    }
  }
}
