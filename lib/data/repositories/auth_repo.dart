import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';
import '../models/message_model.dart';

class AuthRepo extends ApiClient {
  AuthRepo();
  Future<LoginModel> userLogin(
      {required String email,
      required String password,
      required context}) async {
    Map body = {"email": email, "password": password};
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);
      if (response.statusCode == 200) {
        final responseData = LoginModel.fromJson(response.data);
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return LoginModel();
  }

  Future<MessageModel> userLogout({required context}) async {
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.logout, isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = messageModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return MessageModel();
  }
}
