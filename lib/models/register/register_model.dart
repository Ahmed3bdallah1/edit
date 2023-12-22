class RegisterModel {
  bool status;
  Data data;
  Profile profile;
  String token;

  RegisterModel({
    required this.status,
    required this.data,
    required this.profile,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        profile: Profile.fromJson(json["profile"]),
        token: json["token"],
      );
}

class Data {
  String name;
  String email;
  int otp;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.email,
    required this.otp,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        otp: json["otp"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}

class Profile {
  int userId;
  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Profile({
    required this.userId,
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}
