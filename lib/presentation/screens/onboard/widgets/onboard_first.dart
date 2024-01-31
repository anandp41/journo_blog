part of 'widgets_imports.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/onboard1.png",
          height: 333.h,
          width: 333.w,
        ),
        Text(
            "Discover, engage and read the latest articles as well as share your own thoughts and ideas with the community",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}
