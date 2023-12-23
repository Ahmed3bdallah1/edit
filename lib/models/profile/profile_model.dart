import '../login/login_model.dart';

class ProfileModel {
  User user;
  bool status;

  ProfileModel({
    required this.user,
    required this.status,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    user: User.fromJson(json["data"]),
    status: json["status"],
  );
}