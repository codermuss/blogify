import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "session_id")
  String sessionId;
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "access_token_expires_at")
  DateTime accessTokenExpiresAt;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "refresh_token_expires_at")
  DateTime refreshTokenExpiresAt;
  @JsonKey(name: "user")
  User user;

  SignInResponse({
    required this.sessionId,
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
    required this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
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
  String avatar;
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
