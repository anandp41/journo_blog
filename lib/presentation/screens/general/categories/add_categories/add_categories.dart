part of 'add_categories_imports.dart';

@RoutePage<CategoriesModel>()
class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  late AddCategoriesViewModel addCategoriesViewModel;

  @override
  void initState() {
    addCategoriesViewModel =
        AddCategoriesViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        backgroundColor: MyColors.primaryColor,
        title: "Add Categories".text.size(16).white.make(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              24.verticalSpace,
              VxTextField(
                controller: addCategoriesViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Title",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              40.h.heightBox,
              VxTextField(
                controller: addCategoriesViewModel.textEditingController,
                fillColor: Colors.transparent,
                borderColor: MyColors.primaryColor,
                borderRadius: 10,
                hint: "Slug",
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: addCategoriesViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                      title: "Add New Category",
                      isLoading: state.data,
                      onPressed: () =>
                          addCategoriesViewModel.addNewCategories(context));
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
    addCategoriesViewModel.textEditingController.dispose();
    super.dispose();
  }
}
