import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:journo_blog/data/data_sources/remote/api_constant.dart';
import 'package:journo_blog/data/data_sources/remote/api_exception.dart';

import '../../../utils/utils.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;
  ApiClient() {
    baseOptions = BaseOptions(
      baseUrl: ApiConstant.mainUrl,
    );

    dio = Dio(baseOptions);
  }

  Options options = Options();

  Future<Response> getRequest(
      {required String path, bool isTokenRequired = false}) async {
    if (isTokenRequired) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({"Authorization": "Bearer $token"});
    }

    try {
      debugPrint("🚀**********API REQUEST*********🚀");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");
      var response = await dio.get(path);
      debugPrint("🔥**********API RESPONDED*********🔥");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA ${response.data}");
      // debugPrint(response.data);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response?.data.toString());
        debugPrint(e.response?.headers.toString());
        debugPrint(e.response?.requestOptions.toString());
        throw ApiException(message: e.response?.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> postRequest(
      {required String path,
      dynamic body,
      bool isTokenRequired = false}) async {
    if (isTokenRequired) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({"Authorization": "Bearer $token"});
    }

    // var token = await Utils.getToken();

    // final options = Options(headers: {"Authorization": "Bearer $token"});
    // dio.interceptors.add(PrettyDioLogger());
    try {
      debugPrint("🚀**********API REQUEST*********🚀");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");
      debugPrint("Body: $body");
      var response = await dio.post(path, data: body, options: options);
      debugPrint("🔥**********API RESPONDED*********🔥");
      debugPrint("Status Code: ${response.statusCode}");
      //log("DATA ${response.data}");
      // debugPrint(response.data);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response?.data.toString());
        debugPrint(e.response?.headers.toString());
        debugPrint(e.response?.requestOptions.toString());
        throw ApiException(message: e.response?.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
