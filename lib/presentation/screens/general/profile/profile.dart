part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;
  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getUserProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
                  onPressed: () => profileViewModel.logout(context),
                  icon: const Icon(FeatherIcons.logOut))
              .pOnly(right: 10)
        ],
      ),
      body:
          BlocBuilder<VelocityBloc<ProfileModel>, VelocityState<ProfileModel>>(
        bloc: profileViewModel.profileModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return RefreshIndicator(
              onRefresh: () => profileViewModel.getUserProfileData(context),
              child: ListView(
                children: [
                  Container(
                    height: 500,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: MyColors.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(state
                                .data.userDetails!.profilePhotoUrl
                                .toString()),
                          ),
                          10.h.heightBox,
                          state.data.userDetails!.name!.text.bold.xl2.white
                              .make(),
                          state.data.userDetails!.email!.text.xl.white.make(),
                          20.h.heightBox,
                          state.data.userDetails!.about!.text.xl.center.white
                              .make()
                              .pSymmetric(h: 20),
                          20.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  state.data.postsCount!.text.white.bold.xl3
                                      .make(),
                                  "Posts".text.white.make()
                                ],
                              ),
                              Column(
                                children: [
                                  "0".text.white.bold.xl3.make(),
                                  "Following".text.white.make()
                                ],
                              ),
                              Column(
                                children: [
                                  "6".text.white.bold.xl3.make(),
                                  "Followers".text.white.make()
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.h.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "My Posts".text.xl3.bold.make(),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.postsCount,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 13,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            var userPostData = state.data.posts![index];
                            return Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  maxHeightDiskCache: 220,
                                  imageUrl: userPostData.featuredimage
                                      .toString()
                                      .prepend(
                                          "https://techblog.codersangam.com/")
                                      .replaceAll("public", "storage"),
                                ).cornerRadius(20),
                                6.h.heightBox,
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      userPostData.title!.text.medium
                                          .maxLines(2)
                                          .make(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              FeatherIcons.moreVertical))
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
