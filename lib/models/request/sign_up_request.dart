import 'package:blogify/models/base/base_reques.dart';
import 'package:blogify/utilities/constants/app_request_keys.dart';

final class SignUpRequest extends BaseRequest {
  final String username;
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String birthdate;

  SignUpRequest({
    required this.username,
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.birthdate,
  });
  @override
  Map<String, dynamic> toJson() => {
        AppRequestKeys.username: username,
        AppRequestKeys.fullName: fullName,
        AppRequestKeys.email: email,
        AppRequestKeys.password: password,
        AppRequestKeys.birthdate: birthdate,
      };
}
