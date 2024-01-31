part of 'add_tags_imports.dart';

@RoutePage<TagsModel>()
class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  late AddTagsViewModel addTagsViewModel;

  @override
  void initState() {
    addTagsViewModel = AddTagsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        backgroundColor: MyColors.primaryColor,
        title: "Add Tags".text.size(16).white.make(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              24.verticalSpace,
              VxTextField(
                controller: addTagsViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Title",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              40.h.heightBox,
              VxTextField(
                controller: addTagsViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Slug",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: addTagsViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                      title: "Add New Tag",
                      isLoading: state.data,
                      onPressed: () => addTagsViewModel.addNewTags(context));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    addTagsViewModel.textEditingController.dispose();
    super.dispose();
  }
}
