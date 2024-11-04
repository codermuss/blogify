import 'package:blogify/models/base/base_reques.dart';

import '../../../utilities/constants/app_request_keys.dart';

class SignInRequest extends BaseRequest {
  String username;
  String password;
  String fullName;
  String email;
  String? avatar;
  DateTime birthDate;

  SignInRequest({
    required this.username,
    required this.password,
    required this.fullName,
    required this.email,
    required this.avatar,
    required this.birthDate,
  });

  @override
  Map<String, dynamic> toJson() => {
        AppRequestKeys.username: username,
        AppRequestKeys.password: password,
        AppRequestKeys.fullName: fullName,
        AppRequestKeys.email: email,
        if (avatar != null) AppRequestKeys.avatar: avatar,
        AppRequestKeys.birthdate: birthDate,
      };
}
