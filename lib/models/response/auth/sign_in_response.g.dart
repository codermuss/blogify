// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) => SignInResponse(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      passwordChangedAt: DateTime.parse(json['password_changed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
