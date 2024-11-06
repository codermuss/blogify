// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) => SignUpResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      userId: (json['user_id'] as num).toInt(),
      bio: json['bio'] as String,
      postCount: (json['post_count'] as num).toInt(),
      likeCount: (json['like_count'] as num).toInt(),
      followerCount: (json['follower_count'] as num).toInt(),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String?,
      birthDate: DateTime.parse(json['birth_date'] as String),
      passwordChangedAt: DateTime.parse(json['password_changed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
