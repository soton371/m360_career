class UserInfoModel {
  final int? userId;
  final String? fullName;
  final String? email;
  final String? userImage;
  final String? token;

  UserInfoModel({
    this.userId,
    this.fullName,
    this.email,
    this.userImage,
    this.token,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    userId: json["user_id"],
    fullName: json["full_name"],
    email: json["email"],
    userImage: json["user_image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "email": email,
    "user_image": userImage,
    "token": token,
  };
}
