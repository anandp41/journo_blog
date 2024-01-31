part of 'common_widgets_imports.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const OutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: MyColors.kWhiteColor),
                borderRadius: BorderRadius.circular(11.r)),
            minimumSize: Size(MediaQuery.of(context).size.width, 44.h)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ));
  }
}
