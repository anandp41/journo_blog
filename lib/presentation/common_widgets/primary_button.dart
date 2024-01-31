part of 'common_widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r)),
            minimumSize: Size(MediaQuery.of(context).size.width, 44.h)),
        onPressed: onPressed,
        child: isLoading == true
            ? const CircularProgressIndicator(
                color: MyColors.kWhiteColor,
              )
            : Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ));
  }
}
