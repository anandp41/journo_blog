part of 'add_categories_imports.dart';

class AddCategoriesViewModel {
  final Repository repository;
  AddCategoriesViewModel({required this.repository});
  final textEditingController = TextEditingController();
  final isLoadingBloc = VelocityBloc<bool>(false);
  addNewCategories(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoriesRepo.addNewCategories(
        textEditingController.text,
        textEditingController.text.toLowerCase().replaceAll(" ", "-"));
    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      var newData = await repository.categoriesRepo.getAllCategories();
      isLoadingBloc.onUpdateData(false);
      await AutoRouter.of(context).pop<CategoriesModel>(newData);
    }
  }
}
