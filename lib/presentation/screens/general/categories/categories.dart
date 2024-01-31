part of 'categories_imports.dart';

@RoutePage<Category>()
class Categories extends StatefulWidget {
  const Categories({super.key, required this.navigateType});
  final NavigateType navigateType;
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoriesViewModel categoriesViewModel;
  @override
  void initState() {
    categoriesViewModel =
        CategoriesViewModel(repository: context.read<Repository>());
    categoriesViewModel.fetchAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading:
            widget.navigateType == NavigateType.outer ? false : true,
        title: "Categories".text.size(16).color(MyColors.kWhiteColor).make(),
        actions: [
          IconButton(
              onPressed: () => categoriesViewModel.goToAddCategories(context),
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.kWhiteColor,
              ))
        ],
      ),
      body: BlocBuilder<VelocityBloc<CategoriesModel>,
          VelocityState<CategoriesModel>>(
        bloc: categoriesViewModel.categoriesModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.data.categories!.length,
              itemBuilder: (context, index) {
                var categoryData = state.data.categories![index];
                return Card(
                  child: ListTile(
                    leading: "${index + 1}".text.size(16).make(),
                    title: categoryData.title!.text.size(16).make(),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => categoriesViewModel
                                  .goToUpdateCategories(context, categoryData),
                              icon: const Icon(
                                FeatherIcons.edit2,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () =>
                                  categoriesViewModel.deleteCategories(context,
                                      categoryData.id.toString(), index),
                              icon: const Icon(
                                FeatherIcons.trash,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.navigateType == NavigateType.outer
                          ? null
                          : AutoRouter.of(context).pop<Category>(categoryData);
                    },
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
