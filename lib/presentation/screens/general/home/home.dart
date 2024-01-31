part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
          bloc: homeViewModel.postBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is VelocityUpdateState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Hello ${context.read<VelocityBloc<ProfileModel>>().state.data.userDetails!.name}"
                            .text
                            .bold
                            .xl
                            .make(),
                        CachedNetworkImage(
                          imageUrl: context
                              .read<VelocityBloc<ProfileModel>>()
                              .state
                              .data
                              .userDetails!
                              .profilePhotoUrl!,
                          height: 50,
                        )
                      ],
                    ).pSymmetric(h: 16),
                    30.h.heightBox,
                    VxSwiper.builder(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: state.data.popularPosts!.length,
                      itemBuilder: (context, index) {
                        var popularPosts = state.data.popularPosts![index];
                        var imagePath = popularPosts.featuredimage
                            .toString()
                            .prepend("https://techblog.codersangam.com/")
                            .replaceAll("public", "storage");
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imagePath,
                        ).cornerRadius(20).pSymmetric(h: 10);
                      },
                    ),
                    20.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Latest Posts".text.size(16).make(),
                        "See All".text.size(16).make()
                      ],
                    ).pSymmetric(h: 24.w),
                    10.h.heightBox,
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      shrinkWrap: true,
                      itemCount: state.data.allPosts!.length,
                      itemBuilder: (context, index) {
                        var latestPosts = state.data.allPosts![index];
                        var imagePath = latestPosts.featuredimage
                            .toString()
                            .prepend("https://techblog.codersangam.com/")
                            .replaceAll("public", "storage");
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => AutoRouter.of(context)
                                  .push(HomeDetailsRoute(post: latestPosts)),
                              child: Hero(
                                tag: Key(latestPosts.id.toString()),
                                child: CachedNetworkImage(
                                  imageUrl: imagePath,
                                  height: 120,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ).cornerRadius(20),
                              ),
                            ),
                            10.w.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestPosts.title!.text
                                      .size(16)
                                      .bold
                                      .maxLines(2)
                                      .make(),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      latestPosts.createdAt!
                                          .timeAgo()
                                          .toString()
                                          .text
                                          .size(14.sp)
                                          .make()
                                    ],
                                  ),
                                  6.h.heightBox,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${latestPosts.views} Views"
                                          .toString()
                                          .text
                                          .bold
                                          .make(),
                                      const Icon(FeatherIcons.bookmark)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
