import 'package:blogify/models/response/auth/sign_in_response.dart';
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

  factory Profile.empty() => Profile(
        userId: 0,
        bio: '',
        postCount: 0,
        likeCount: 0,
        followerCount: 0,
      );
}
