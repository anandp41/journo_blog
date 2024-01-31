part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;
  HomeViewModel({required this.repository});
  final VelocityBloc<HomeModel> postBloc = VelocityBloc<HomeModel>(HomeModel());

  fetchAllPosts() async {
    var postData = await repository.postRepo.getAllPosts();
    if (postData.status == 1) {
      postBloc.onUpdateData(postData);
    }
  }
}
