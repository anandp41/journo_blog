import 'package:journo_blog/data/models/message_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/categories/categories_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class CategoriesRepo extends ApiClient {
  CategoriesRepo();
  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.categories);
      if (response.statusCode == 200) {
        final responseData = CategoriesModel.fromJson(response.data);
        // Vx.log(responseData);
        return responseData;
      }
    } on Exception catch (e) {
      Vx.log(e);
    }
    return CategoriesModel();
  }

  Future<MessageModel> addNewCategories(String title, String slug) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.addCategories,
          body: body,
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

  Future<MessageModel> updateCategories(
      String id, String title, String slug) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.updateCategories,
          body: body,
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

  Future<MessageModel> deleteCategories(String id) async {
    try {
      final response = await postRequest(
          path: "${ApiEndpointUrls.deleteCategories}/$id",
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
