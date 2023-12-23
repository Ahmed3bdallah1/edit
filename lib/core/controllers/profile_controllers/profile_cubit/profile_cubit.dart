import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/profile_controllers/profile_cubit/profile_state.dart';
import 'package:graduation_project/models/profile/profile_model.dart';
import '../../../local/shared_preferences.dart';
import '../../../managers/managers.dart';
import '../../../remote/api_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  ApiConstants constants = ApiConstants();
  ProfileModel? model;

  Future<void> profileApi() async {
    var response = await http.get(
      Uri.parse(constants.profileUrl),
      headers: {'Authorization': 'Bearer $generalToken'},
    );
    if (response.statusCode == 200) {
      var jsonResounse = json.decode(response.body);
      model= ProfileModel.fromJson(jsonResounse);
      var name = jsonResounse["data"]["name"];
      var email = jsonResounse["data"]["email"];
      var id = jsonResounse["data"]["id"];
      CacheHelper.saveData(key: "name", value: name).then((value) {
        generalName = name;
      });
      CacheHelper.saveData(key: "email", value: email).then((value) {
        generalEmail = email;
      });
      CacheHelper.saveData(key: "id", value: id).then((value) {
        generalID = id;
      });
      print(generalName);
      print(generalID);
      print(generalEmail);
      emit(DoneStateProfile(model!));
    } else {
      print(response.statusCode);
      emit(ErrorStateProfile(response.body));
    }
  }
}
