part of 'update_tags_imports.dart';

@RoutePage<TagsModel>()
class UpdateTags extends StatefulWidget {
  final Tag tag;
  const UpdateTags({super.key, required this.tag});

  @override
  State<UpdateTags> createState() => _UpdateTagsState();
}

class _UpdateTagsState extends State<UpdateTags> {
  late UpdateTagsViewModel updateTagsViewModel;

  @override
  void initState() {
    updateTagsViewModel =
        UpdateTagsViewModel(repository: context.read<Repository>());
    updateTagsViewModel.textEditingController.text =
        widget.tag.title.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        backgroundColor: MyColors.primaryColor,
        title: "Update Tags".text.size(16).white.make(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              24.verticalSpace,
              VxTextField(
                controller: updateTagsViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Title",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              40.h.heightBox,
              VxTextField(
                controller: updateTagsViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Slug",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: updateTagsViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                      title: "Update Tag",
                      isLoading: state.data,
                      onPressed: () => updateTagsViewModel.updateTags(
                          context, widget.tag.id.toString()));
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
    updateTagsViewModel.textEditingController.dispose();
    super.dispose();
  }
}
