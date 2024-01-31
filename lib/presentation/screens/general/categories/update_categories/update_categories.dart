part of 'update_categories_imports.dart';

@RoutePage<CategoriesModel>()
class UpdateCategories extends StatefulWidget {
  final Category category;
  const UpdateCategories({super.key, required this.category});

  @override
  State<UpdateCategories> createState() => _UpdateCategoriesState();
}

class _UpdateCategoriesState extends State<UpdateCategories> {
  late UpdateCategoriesViewModel updateCategoriesViewModel;

  @override
  void initState() {
    updateCategoriesViewModel =
        UpdateCategoriesViewModel(repository: context.read<Repository>());
    updateCategoriesViewModel.textEditingController.text =
        widget.category.title.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        backgroundColor: MyColors.primaryColor,
        title: "Update Categories".text.size(16).white.make(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              24.verticalSpace,
              VxTextField(
                controller: updateCategoriesViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Title",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              40.h.heightBox,
              VxTextField(
                controller: updateCategoriesViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Slug",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: updateCategoriesViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                      title: "Update Tag",
                      isLoading: state.data,
                      onPressed: () =>
                          updateCategoriesViewModel.updateCategories(
                              context, widget.category.id.toString()));
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
    updateCategoriesViewModel.textEditingController.dispose();
    super.dispose();
  }
}
