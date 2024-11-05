// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      sessionId: json['session_id'] as String,
      accessToken: json['access_token'] as String,
      accessTokenExpiresAt:
          DateTime.parse(json['access_token_expires_at'] as String),
      refreshToken: json['refresh_token'] as String,
      refreshTokenExpiresAt:
          DateTime.parse(json['refresh_token_expires_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      passwordChangedAt: DateTime.parse(json['password_changed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
