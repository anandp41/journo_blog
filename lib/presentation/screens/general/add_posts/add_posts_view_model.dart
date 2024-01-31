part of 'add_posts_imports.dart';

class AddPostsViewModel {
  final Repository repository;

  AddPostsViewModel({required this.repository});
  final ImagePicker picker = ImagePicker();
  final QuillController _controller = QuillController.basic();
  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);
  final VelocityBloc<Category?> selectedCategoryBloc =
      VelocityBloc<Category?>(null);
  final textEditingController = TextEditingController();
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No image selected");
    }
  }

  addPost(context, String userId) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.postRepo.addNewPost(
        textEditingController.text,
        textEditingController.text.replaceAll(" ", "-"),
        selectedCategoryBloc.state.data!.id.toString(),
        selectedTagBloc.state.data!.id.toString(),
        _controller.document.toPlainText(),
        userId,
        selectedImageBloc.state.data!.path,
        selectedImageBloc.state.data!.name);
    if (data.status == 1) {
      isLoadingBloc.onUpdateData(false);
      clear();
      VxToast.show(context, msg: data.message!);
    }
  }

  clear() {
    textEditingController.clear();
    selectedImageBloc.onUpdateData(null);
    selectedCategoryBloc.onUpdateData(null);
    selectedTagBloc.onUpdateData(null);
    _controller.clear();
  }
}
