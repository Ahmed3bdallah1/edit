class AppliedModel {
  bool status;
  List<AppliedData> appliedData;

  AppliedModel({
    required this.status,
    required this.appliedData,
  });

  factory AppliedModel.fromJson(Map<String, dynamic> json) => AppliedModel(
    status: json["status"],
    appliedData: List<AppliedData>.from(json["data"].map((x) => AppliedData.fromJson(x))),
  );
}

class AppliedData {
  int id;
  String name;
  String email;
  String mobile;
  String workType;
  String cvFile;
  String otherFile;
  int jobsId;
  int userId;
  int reviewed;
  dynamic accept;
  DateTime createdAt;
  DateTime updatedAt;

  AppliedData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.workType,
    required this.cvFile,
    required this.otherFile,
    required this.jobsId,
    required this.userId,
    required this.reviewed,
    required this.accept,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppliedData.fromJson(Map<String, dynamic> json) => AppliedData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    workType: json["work_type"],
    cvFile: json["cv_file"],
    otherFile: json["other_file"],
    jobsId: json["jobs_id"],
    userId: json["user_id"],
    reviewed: json["reviewed"],
    accept: json["accept"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
