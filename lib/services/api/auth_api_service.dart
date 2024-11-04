import 'package:blogify/mixin/api_service_supporter.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:blogify/models/request/auth/sign_up_request.dart';
import 'package:blogify/models/response/auth/sign_in_response.dart';
import 'package:blogify/models/response/auth/sign_up_response.dart';
import 'package:blogify/utilities/constants/app_api_paths.dart';

import '../../models/base/base_response.dart';

class AuthApiService with ApiServiceSupporter {
  Future<BaseResponse<SignUpResponse>> signUp(SignUpRequest request) async => dioHttpClient.send<SignUpResponse, SignUpResponse>(
        path: AppApiPaths.signUp,
        fromJson: SignUpResponse.fromJson,
        data: request,
      );

  Future<BaseResponse<SignInResponse>> signIn(SignInRequest request) async => dioHttpClient.send<SignInResponse, SignInResponse>(
        path: AppApiPaths.signIn,
        fromJson: SignInResponse.fromJson,
        data: request,
      );
}
