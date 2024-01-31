part of 'tags_imports.dart';

@RoutePage<Tag>()
class Tags extends StatefulWidget {
  const Tags({super.key, required this.navigateType});
  final NavigateType navigateType;
  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;
  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
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
        title: "Tags".text.size(16).color(MyColors.kWhiteColor).make(),
        actions: [
          IconButton(
              onPressed: () => tagsViewModel.goToAddTags(context),
              icon: const Icon(
                FeatherIcons.plus,
                color: MyColors.kWhiteColor,
              ))
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
        bloc: tagsViewModel.tagsModelBloc,
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
              itemCount: state.data.tags!.length,
              itemBuilder: (context, index) {
                var tagsData = state.data.tags![index];
                return Card(
                  child: ListTile(
                    leading: "${index + 1}".text.size(16).make(),
                    title: tagsData.title!.text.size(16).make(),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => tagsViewModel.goToUpdateTags(
                                  context, tagsData),
                              icon: const Icon(
                                FeatherIcons.edit2,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () => tagsViewModel.deleteTags(
                                  context, tagsData.id.toString(), index),
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
                          : AutoRouter.of(context).pop<Tag>(tagsData);
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
