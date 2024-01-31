part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  final Post post;
  const HomeDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.kWhiteColor),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        title: post.title!.text.color(MyColors.kWhiteColor).ellipsis.make(),
      ),
      body: ListView(
        children: [
          Hero(
              tag: Key(post.id.toString()),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: post.featuredimage
                      .toString()
                      .prepend("https://techblog.codersangam.com/")
                      .replaceAll("public", "storage"))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                10.h.heightBox,
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "${post.views} Views".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                HtmlWidget(post.body!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
