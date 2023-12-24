class PortfoliosModel {
  bool status;
  PortflioData data;

  PortfoliosModel({
    required this.status,
    required this.data,
  });

  factory PortfoliosModel.fromJson(Map<String, dynamic> json) =>
      PortfoliosModel(
        status: json["status"],
        data: PortflioData.fromJson(json["data"]),
      );
}

class PortflioData {
  List<dynamic> portfolio;
  Profile profile;

  PortflioData({
    required this.portfolio,
    required this.profile,
  });

  factory PortflioData.fromJson(Map<String, dynamic> json) => PortflioData(
        portfolio:
            List<dynamic>.from(json["portfolio"].map((x) => x)),
        profile: Profile.fromJson(json["profile"]),
      );
}

class Profile {
  int id;
  int userId;
  String name;
  String email;
  dynamic mobile;
  dynamic address;
  dynamic language;
  dynamic interestedWork;
  dynamic offlinePlace;
  dynamic remotePlace;
  dynamic bio;
  dynamic education;
  dynamic experience;
  dynamic personalDetailed;
  DateTime createdAt;
  DateTime updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.language,
    required this.interestedWork,
    required this.offlinePlace,
    required this.remotePlace,
    required this.bio,
    required this.education,
    required this.experience,
    required this.personalDetailed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        language: json["language"],
        interestedWork: json["interested_work"],
        offlinePlace: json["offline_place"],
        remotePlace: json["remote_place"],
        bio: json["bio"],
        education: json["education"],
        experience: json["experience"],
        personalDetailed: json["personal_detailed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
