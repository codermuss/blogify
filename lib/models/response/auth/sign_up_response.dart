import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "user")
  User user;
  @JsonKey(name: "profile")
  Profile profile;

  SignUpResponse({
    required this.user,
    required this.profile,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class Profile {
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "bio")
  String bio;
  @JsonKey(name: "post_count")
  int postCount;
  @JsonKey(name: "like_count")
  int likeCount;
  @JsonKey(name: "follower_count")
  int followerCount;

  Profile({
    required this.userId,
    required this.bio,
    required this.postCount,
    required this.likeCount,
    required this.followerCount,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "full_name")
  String fullName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "birth_date")
  DateTime birthDate;
  @JsonKey(name: "password_changed_at")
  DateTime passwordChangedAt;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.role,
    required this.avatar,
    required this.birthDate,
    required this.passwordChangedAt,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
