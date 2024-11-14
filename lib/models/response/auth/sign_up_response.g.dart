// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
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
