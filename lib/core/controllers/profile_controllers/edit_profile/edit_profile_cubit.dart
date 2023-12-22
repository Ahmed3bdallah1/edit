import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);


  ApiConstants constants = ApiConstants();

  void editProfileData(BuildContext context,
      {required String bio,
        required String address,
        required String mobile}) async {
    var response = await http.put(Uri.parse(constants.editProfileUrl),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({
          "bio": bio,
          "address": address,
          "mobile": mobile,
        }));

    if (response.statusCode == 200) {
      emit(DoneEditState());
    } else {
      emit(ErrorProfileState());
    }
  }

}
