import 'package:dio/dio.dart';
import 'package:journo_blog/presentation/screens/general/profile/profile_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/home/home_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';
import '../models/message_model.dart';

class PostRepo extends ApiClient {
  PostRepo();
  Future<HomeModel> getAllPosts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.posts);
      if (response.statusCode == 200) {
        final responseData = HomeModel.fromJson(response.data);
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      Vx.log(e);
    }
    return HomeModel();
  }

  Future<ProfileModel> getUserPosts() async {
    try {
      final response = await getRequest(
          path: ApiEndpointUrls.userPosts, isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = ProfileModel.fromJson(response.data);
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      Vx.log(e);
    }
    return ProfileModel();
  }

  Future<MessageModel> addNewPost(
      String title,
      String slug,
      String categoryId,
      String tagId,
      String body,
      String userId,
      String filePath,
      String fileName) async {
    final formData = FormData.fromMap({
      'title': title,
      'slug': slug,
      'categories': categoryId,
      'tags': tagId,
      'body': body,
      'status': '1',
      'user_id': userId,
      'featuredimage':
          await MultipartFile.fromFile(filePath, filename: fileName),
    });

    try {
      final response = await postRequest(
          path: ApiEndpointUrls.addPosts,
          body: formData,
          isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = MessageModel.fromJson(response.data);
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      Vx.log(e);
    }
    return MessageModel();
  }
}
