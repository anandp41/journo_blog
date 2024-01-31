part of 'update_tags_imports.dart';

class UpdateTagsViewModel {
  final Repository repository;
  UpdateTagsViewModel({required this.repository});
  final textEditingController = TextEditingController();
  final isLoadingBloc = VelocityBloc<bool>(false);
  updateTags(context, String id) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.tagsRepo.updateTags(
        id,
        textEditingController.text,
        textEditingController.text.toLowerCase().replaceAll(" ", "-"));
    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      var newData = await repository.tagsRepo.getAllTags();
      isLoadingBloc.onUpdateData(false);
      await AutoRouter.of(context).pop<TagsModel>(newData);
    }
  }
}
