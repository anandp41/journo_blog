part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(MyAssets.assetsImagesAuthBg),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    MyAssets.assetsImagesJournoLogo,
                    height: 42.h,
                    width: 139.w,
                  ),
                ),
                const Spacer(),
                Text(
                  "Explore the world,\nBillions of Thoughts.",
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                20.h.heightBox,
                PrimaryButton(
                    title: "Login",
                    onPressed: () =>
                        AutoRouter.of(context).push(const LoginRoute())),
                12.h.heightBox,
                OutlineButton(
                    title: "Register",
                    onPressed: () =>
                        AutoRouter.of(context).push(const RegisterRoute())),
                12.h.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
