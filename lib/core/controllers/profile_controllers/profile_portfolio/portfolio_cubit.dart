import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/profile_controllers/profile_portfolio/portfolio_state.dart';
import 'package:graduation_project/models/profile/portiolio_model.dart';
import 'package:http/http.dart' as http;
import '../../../managers/managers.dart';
import '../../../managers/utils/dialogs/snak_bar.dart';
import '../../../remote/api_constants.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());

  static PortfolioCubit get(BuildContext context) => BlocProvider.of(context);
  ApiConstants constants = ApiConstants();
  PortfoliosModel? model;

  Future<void> postCv(BuildContext context, String file, String image) async {
    var response = await http.post(Uri.parse(constants.portifolioUrl),
        headers: {'Authorization': 'Bearer $generalToken'},
        body: jsonEncode({"cv_file": file, "image": image}));
    if (response.statusCode == 200) {
      print(response.statusCode);
      emit(DonePortfolioState());
    } else {
      showSnakBar(context, response.statusCode.toString());
      print(response.statusCode);
      emit(ErrorPortfolioState());
    }
  }

  Future<List<dynamic>> getCVs() async {
    var response = await http.get(Uri.parse(constants.portifolioUrl),
        headers: {'Authorization': 'Bearer $generalToken'});

    if (response.statusCode == 200) {
      var xresponse = json.decode(response.body);
      print(xresponse);
      model = PortfoliosModel.fromJson(xresponse);
      var portflioData = xresponse["data"]["portfolio"];
      print(portflioData);
      emit(DoneGetPortfoliosState());
      return List<dynamic>.from(portflioData);
    } else {
      emit(ErrorGetPortfoliosState());
      return [];
    }
  }

  upload(BuildContext context) async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    FilePickerResult? imageResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (filePickerResult != null) {
      File file = File(filePickerResult.files.single.path ?? " ");
      // String fileName = file.path.split("/").last;
      String filePath = file.path;

      File image = File(imageResult!.files.single.path ?? " ");
      // String imageName = image.path.split("/").last;
      String imagePath = image.path;

      postCv(context, filePath, imagePath);
    } else {
      print("result is null");
    }
  }
}
