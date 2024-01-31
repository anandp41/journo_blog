part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;
  LoginViewModel({required this.repository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoadingBloc = VelocityBloc<bool>(false);
  login(context) async {
    isLoadingBloc.onUpdateData(true);
    var loginData = await repository.authRepo.userLogin(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    if (loginData.accessToken != null) {
      Utils.saveToken(loginData.accessToken.toString());
      AutoRouter.of(context).push(const GeneralRoute());
    }
    isLoadingBloc.onUpdateData(false);
  }
}
