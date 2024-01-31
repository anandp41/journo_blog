part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  static const List<TabItem> items = [
    TabItem(
      icon: FeatherIcons.home,
      // title: 'Home',
    ),
    TabItem(
      icon: FeatherIcons.tag,
      // title: 'Shop',
    ),
    TabItem(
      icon: FeatherIcons.plus,
      // title: 'Wishlist',
    ),
    TabItem(
      icon: FeatherIcons.hash,
      title: 'Cart',
    ),
    TabItem(
      icon: FeatherIcons.user,
      // title: 'profile',
    ),
  ];
  int visit = 0;
  List<Widget> pages = [
    const Home(),
    const Categories(navigateType: NavigateType.outer),
    const AddPosts(),
    const Tags(navigateType: NavigateType.outer),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: visit,
        children: pages,
      )

      //pages.elementAt(visit)

      ,
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: MyColors.kWhiteColor,
        color: MyColors.primaryColor.withOpacity(0.3),
        colorSelected: MyColors.primaryColor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
          // debugPrint(visit.toString());
        }),
      ),
    );
  }
}
