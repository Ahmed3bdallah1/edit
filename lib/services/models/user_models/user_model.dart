class UserModel {
  final int id;
  final String token;
  final int isVerified;

  UserModel({
    required this.token,
    required this.id,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        isVerified: json["isVerified"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "isVerified": isVerified,
      };
}
