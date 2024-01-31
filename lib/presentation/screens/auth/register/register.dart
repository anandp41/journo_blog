part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: FadedScaleAnimation(
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  MyAssets.assetsImagesJournoLogo,
                  height: 42.h,
                  width: 139.w,
                ),
              ),
              100.h.heightBox,
              Container(
                  height: MediaQuery.sizeOf(context).height.h,
                  width: MediaQuery.sizeOf(context).width.w,
                  decoration: const BoxDecoration(
                      color: MyColors.kWhiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.h.heightBox,
                        const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 18,
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        48.h.heightBox,
                        "Email".text.make(),
                        8.h.heightBox,
                        const VxTextField(
                          fillColor: Colors.transparent,
                          borderColor: MyColors.primaryColor,
                          borderRadius: 10,
                          hint: "YourEmail@Example.com",
                          prefixIcon: Icon(Icons.email),
                          borderType: VxTextFieldBorderType.roundLine,
                        ),
                        20.h.heightBox,
                        "Password".text.make(),
                        8.h.heightBox,
                        const VxTextField(
                          isPassword: true,
                          obscureText: true,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.primaryColor,
                          borderRadius: 10,
                          prefixIcon: Icon(Icons.lock),
                          borderType: VxTextFieldBorderType.roundLine,
                        ),
                        20.h.heightBox,
                        "Confirm Password".text.make(),
                        8.h.heightBox,
                        const VxTextField(
                          isPassword: true,
                          obscureText: true,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.primaryColor,
                          borderRadius: 10,
                          prefixIcon: Icon(Icons.lock),
                          borderType: VxTextFieldBorderType.roundLine,
                        ),
                        40.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: false,
                                onChanged: (value) {},
                                title: "Remember Me".text.make(),
                              ),
                            ),
                            "Forgot Password".text.size(14).make()
                          ],
                        ),
                        40.h.heightBox,
                        PrimaryButton(
                          title: "Login",
                          onPressed: () {},
                        ),
                        20.h.heightBox,
                        "Already have an account?"
                            .richText
                            .size(14)
                            .semiBold
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                              text: " Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => AutoRouter.of(context)
                                    .replace(const LoginRoute()),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                        ]).makeCentered()
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
