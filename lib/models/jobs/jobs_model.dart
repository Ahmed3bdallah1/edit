class JobsModel {
  bool? status;
  List<Data>? data;

  JobsModel({
    required this.status,
    required this.data,
  });

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
    status: json["status"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );
}

class Data {
  int id;
  String name;
  String image;
  String jobTimeType;
  String jobType;
  String jobLevel;
  String jobDescription;
  String jobSkill;
  String compName;
  String compEmail;
  String compWebsite;
  String aboutComp;
  String location;
  String salary;
  int favorites;
  int expired;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.jobTimeType,
    required this.jobType,
    required this.jobLevel,
    required this.jobDescription,
    required this.jobSkill,
    required this.compName,
    required this.compEmail,
    required this.compWebsite,
    required this.aboutComp,
    required this.location,
    required this.salary,
    required this.favorites,
    required this.expired,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    jobTimeType: json["job_time_type"],
    jobType: json["job_type"],
    jobLevel: json["job_level"],
    jobDescription: json["job_description"],
    jobSkill: json["job_skill"],
    compName: json["comp_name"],
    compEmail: json["comp_email"],
    compWebsite: json["comp_website"],
    aboutComp: json["about_comp"],
    location: json["location"],
    salary: json["salary"],
    favorites: json["favorites"],
    expired: json["expired"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
