import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "full_name")
  String fullName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "birth_date")
  DateTime birthDate;
  @JsonKey(name: "password_changed_at")
  DateTime passwordChangedAt;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  SignInResponse({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.avatar,
    required this.birthDate,
    required this.passwordChangedAt,
    required this.createdAt,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
}
