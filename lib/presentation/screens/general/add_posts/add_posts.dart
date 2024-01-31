part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostsViewModel addPostsViewModel;
  @override
  void initState() {
    addPostsViewModel =
        AddPostsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        title: "Add Post".text.white.make(),
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: addPostsViewModel.isLoadingBloc,
            builder: (context, state) {
              return IconButton(
                  onPressed: () => addPostsViewModel.addPost(
                      context,
                      context
                          .read<VelocityBloc<ProfileModel>>()
                          .state
                          .data
                          .userDetails!
                          .id
                          .toString()),
                  icon: state.data == true
                      ? const CircularProgressIndicator.adaptive(
                          backgroundColor: MyColors.kWhiteColor,
                        )
                      : const Icon(
                          FeatherIcons.check,
                          color: MyColors.kWhiteColor,
                        ));
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          20.h.heightBox,
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
            bloc: addPostsViewModel.selectedImageBloc,
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  state.data != null
                      ? Image.file(
                          File(
                            state.data!.path,
                          ),
                          height: 250.h,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20)
                      : Image.network(
                              "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png")
                          .cornerRadius(20),
                  IconButton(
                      onPressed: () => addPostsViewModel.pickImage(context),
                      icon: const Icon(
                        FeatherIcons.camera,
                        color: MyColors.primaryColor,
                      ))
                ],
              );
            },
          ),
          24.h.heightBox,
          VxTextField(
            hint: "Title",
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            controller: addPostsViewModel.textEditingController,
          ),
          24.h.heightBox,
          VxTextField(
            hint: "Slug",
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            controller: addPostsViewModel.textEditingController,
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
            bloc: addPostsViewModel.selectedTagBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context)
                      .push<Tag>(TagsRoute(navigateType: NavigateType.inner));

                  addPostsViewModel.selectedTagBloc.onUpdateData(data);
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: MyColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.data != null
                          ? state.data!.title!.text.make()
                          : "Tags".text.make(),
                      const Icon(FeatherIcons.chevronRight)
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Category?>, VelocityState<Category?>>(
            bloc: addPostsViewModel.selectedCategoryBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context).push<Category>(
                      CategoriesRoute(navigateType: NavigateType.inner));

                  addPostsViewModel.selectedCategoryBloc.onUpdateData(data);
                },
                child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: MyColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.data != null
                            ? state.data!.title!.text.make()
                            : "Categories".text.make(),
                        const Icon(FeatherIcons.chevronRight)
                      ],
                    )),
              );
            },
          ),
          20.h.heightBox,
          SizedBox(
            height: 500,
            child: Column(
              children: [
                QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    controller: addPostsViewModel._controller,
                  ),
                ),
                QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: addPostsViewModel._controller,
                    readOnly: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    addPostsViewModel._controller.dispose();
    addPostsViewModel.textEditingController.dispose();
    super.dispose();
  }
}
