import 'package:json_annotation/json_annotation.dart';

part 'onboarding.g.dart';

@JsonSerializable()
class Onboarding {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;

  Onboarding({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });

  factory Onboarding.fromJson(Map<String, dynamic> json) => _$OnboardingFromJson(json);
}
