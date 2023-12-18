import 'package:graduation_project/common/managers.dart';

class ApiConstants {
  String loginUrl = '$baseUrl/auth/login';
  String registerUrl = '$baseUrl/auth/register';
  String profileUrl = '$baseUrl/auth/profile';
  String editProfileUrl = '$baseUrl/user/profile/edit';
  String portifolioUrl = '$baseUrl/user/profile/portofolios';
  String editEmail = '$baseUrl/auth/otp';
  String changePassword = "$baseUrl/auth/user/update";
  String getAppliedJobs = '$baseUrl/apply/2';
  String getAllJobs = "$baseUrl/jobs";
  String applyToJob = "$baseUrl/apply";
}
