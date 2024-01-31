part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnBoardViewModel onBoardViewModel = OnBoardViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset(
                  MyAssets.assetsImagesJournoLogo,
                  height: 42.h,
                  width: 139.w,
                  color: MyColors.primaryColor,
                ),
                63.h.heightBox,
                PageView(
                  controller: onBoardViewModel.pageController,
                  children: const [
                    OnBoardFirst(),
                    OnBoardSecond(),
                    OnBoardThird()
                  ],
                ).expand(),
                61.h.heightBox,
                PrimaryButton(
                  title: "Get Started",
                  onPressed: () =>
                      AutoRouter.of(context).push(const AuthRoute()),
                ),
                61.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SmoothPageIndicator(
                      controller: onBoardViewModel.pageController,
                      count: 3,
                      effect: const WormEffect(
                          activeDotColor: MyColors.primaryColor,
                          dotHeight: 12,
                          dotWidth: 12),
                    ),
                    Text(
                      "Next",
                      style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                10.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    onBoardViewModel.pageController.dispose();
    super.dispose();
  }
}
