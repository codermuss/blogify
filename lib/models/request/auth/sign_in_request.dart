import 'package:blogify/models/base/base_reques.dart';

import '../../../utilities/constants/app_request_keys.dart';

class SignInRequest extends BaseRequest {
  String username;
  String password;

  SignInRequest({
    required this.username,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() => {
        AppRequestKeys.username: username,
        AppRequestKeys.password: password,
      };
}
